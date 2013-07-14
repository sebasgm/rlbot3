#!/usr/bin/python
# serdisplay.py
# Serial display tester
# -- must be run as root

import sys, time, datetime, array
import serial
from threading import Thread
from Queue import Queue
import logging
import re

# -------------- configurable settings ---------

# settings for UART1
#DISPLAYPORT = '/dev/ttyO1'
#RX_MUX = 'uart1_rxd'
#TX_MUX = 'uart1_txd'
#MUX_MODE = 0

# settings for UART2
DISPLAYPORT = '/dev/ttyO2'
RX_MUX = 'spi0_sclk'
TX_MUX = 'spi0_d0'
MUX_MODE = 1

# settings for Serial LCD
DISPLAY_TYPE = 'SPARKFUN_KIT'
#DISPLAY_TYPE = 'MATRIX_ORBITAL'
#DISPLAY_TYPE = 'SPARKFUN'

# settings for analog voltage conversion
MAX_ANALOG = 3762 # approx 4096 * (1.65/1.8), since voltage divider gives me max of 1.65 
#  -- actual values of 3762 based on measurements

# settings for display updates
TIME_UPDATE_INTERVAL = 1 # every second
TIME_DISPLAY_ROW = 1
TEMPERATURE_DISPLAY_ROW = 2
LCD_NUM_ROWS = 4
LCD_NUM_COLS = 20

# determines whether debug info is written to the console
Debug = True

# ---------------------------------------------------------

COMMAND_PREFIX = 254
BAUDRATE = 9600
TIMEOUT = 3 # serial port timeout is 3 seconds - only used when reading from display

# MUX settings
RECEIVE_ENABLE = 32

serDisplay = None 
lastUpdateTime = datetime.datetime.now()

numRows = 0
numCols = 0

lastBrightness = 9999

# queue used by sensor threads to pass reading to display
resultsQueue = Queue()


def writeToDisplay(s):
    serDisplay.write(s)
    time.sleep(0.1) # Sparkfun LCD backpack needs pause between commands

def initializeDisplay(rows, cols):
    global serDisplay
    # set the RX pin for Mode 0 with receive bit on
    # - use %X formatter, since value written must be in hex (e.g. write "21" for mode 1 with receive enabled = 33)
    open('/sys/kernel/debug/omap_mux/' + RX_MUX, 'wb').write("%X" % (RECEIVE_ENABLE + MUX_MODE))
    # set the TX pin for Mode 0
    open('/sys/kernel/debug/omap_mux/' + TX_MUX, 'wb').write("%X" % MUX_MODE)
    
    serDisplay = serial.Serial(DISPLAYPORT, BAUDRATE, timeout=TIMEOUT)
    writeToDisplay("hello")
    time.sleep(1)

    setNumCols(cols)
    setNumRows(rows)  
    clearScreen()  
    #if DISPLAY_TYPE == 'MATRIX_ORBITAL':
        ## turn on backlight
        #cmd = array.array('B', (COMMAND_PREFIX, 66, 0))
        #writeToDisplay(cmd.tostring()) 
    
def initializeAnalogIn(analogIndexes):
    for analogIndex in analogIndexes:
        pin = "ain" + str(analogIndex) 
        try:
            open('/sys/kernel/debug/omap_mux/' + pin, 'wb').write("%X" % RECEIVE_ENABLE)
        except:
            print("unable to set mux mode for " + pin)

    
def setCursorPos(row, col, clearRow = False):
    """Position the LCD cursor - row and col are 1-based"""
    if clearRow and DISPLAY_TYPE != 'SPARKFUN':
        # clear the row by writing blanks to all columns in the row
        # move to start of row 
        if DISPLAY_TYPE == 'MATRIX_ORBITAL':
            cmd = array.array('B', (COMMAND_PREFIX, 71, 1, row))
        else:
            cmd = array.array('B', (COMMAND_PREFIX, 128, (row - 1) * numCols))        
        writeToDisplay(cmd.tostring())   
        writeToDisplay(' ' * numCols)   
    if DISPLAY_TYPE == 'MATRIX_ORBITAL':
        cmd = array.array('B', (COMMAND_PREFIX, 71, col, row))
    elif DISPLAY_TYPE == 'SPARKFUN':
        offset = 127 + col
        if row == 2:
            offset = 128  + 63 + col
        elif row == 3:
            offset = 128 + 19 + col
        elif row == 4:
            offset = 128 + 83 + col
        if Debug:
            print("setting cursor pos for Sparkfun " + str(offset))
        cmd = array.array('B', (COMMAND_PREFIX, offset))
    else:        
        cmd = array.array('B', (COMMAND_PREFIX, 128, (row - 1) * numCols + col - 1))
    writeToDisplay(cmd.tostring())  
    
def setNumCols(cols):    
    """Tell the serial backpack the number of columns supported by the LCD"""
    global numCols    
    numCols = cols
    if DISPLAY_TYPE == 'MATRIX_ORBITAL':
        return # not needed for MO command set
    elif DISPLAY_TYPE == 'SPARKFUN':
        cmd = array.array('B', (124,0))
    else:
        cmd = array.array('B', (COMMAND_PREFIX,0))
    if (numCols == 20):
        cmd[1] = 3
    else:
        if (numCols != 16):
            print("WARNING: num columns of %d not valid - must be 16 or 20.  Defaulting to 16", numCols)
            numCols = 16
        cmd[1] = 6        
    writeToDisplay(cmd.tostring())   

    
def setNumRows(rows):
    """Tell the serial backpack the number of rows supported by the LCD"""
    global numRows
    numRows = rows  
    if DISPLAY_TYPE == 'MATRIX_ORBITAL':
        return # not needed for MO command set
    elif DISPLAY_TYPE == 'SPARKFUN':
        cmd = array.array('B', (124,0))
    else:
        cmd = array.array('B', (COMMAND_PREFIX,0))
    if (numRows == 4):
        cmd[1] = 5
    else:
        if (numRows != 2):
            print("WARNING: num rows of %d not valid - must be 2 or 4.  Defaulting to 2", numRows)
            numRows = 2
        cmd[1] = 6
    writeToDisplay(cmd.tostring()) 
 
def setBrightness(brightness):
    global lastBrightness

    if (abs(brightness - lastBrightness) < 5):
        # if analog setting drifs a little, don't bother changing the brightness
        return
    lastBrightness = brightness
    
    if brightness > 255:
        brightness = 255
    elif brightness < 0:
        brightness = 0
        
    # for Sparkfun Serial backpack, brightness range is 128 to 157
    if DISPLAY_TYPE == 'SPARKFUN':
        brightness = 128 + (brightness*29)/ 255        
    if Debug:
        print("setting brightness to " + str(brightness))
    if DISPLAY_TYPE == 'MATRIX_ORBITAL':
        cmd = array.array('B', (COMMAND_PREFIX, 153, brightness))
    elif DISPLAY_TYPE == 'SPARKFUN':  
        cmd = array.array('B', (124, brightness))
    else:
        cmd = array.array('B', (128, brightness))
    writeToDisplay(cmd.tostring())

    
def clearScreen():
    if DISPLAY_TYPE == 'MATRIX_ORBITAL':
        cmd = array.array('B', (COMMAND_PREFIX, 99))
    else:    
        cmd = array.array('B', (COMMAND_PREFIX, 1))
    writeToDisplay(cmd.tostring())

def readAnalog(pinIndex):
    try:
        # add 1 to pin index to get analog pin sys filename 
        reading = open("/sys/devices/platform/tsc/ain" + str(pinIndex + 1), "r").read()
        if Debug:
            print("readAnalog " + str(pinIndex) + ": " + reading)   
        # sometimes string has trailing nulls - delete them         
        #val = reading.rstrip('/0') 
        val = int(re.sub(r'[^\d]+', '', reading))
        return val
    except:
        log.exception('Error in readAnalog')
    
def readBrightness(interval = 1):
    while (1 == 1):
        print("in ReadBrightness")
        try:
            val = readAnalog(0)
            if val: # will be empty if an exception occurred
                # pot on A0 controls LCD brightness
                # convert to value between 0 and 255
                brightness = (255 * val) / MAX_ANALOG                
                # add reading to queue
                resultsQueue.put(("B", brightness))
        except:
            log.exception('Error in readAnalog')
        time.sleep(interval)

def readTemperature(interval = 5):
    while (1 == 1):
        try:
            # get 1 reading per second - will use the average (since MCP9700A reading tends to jump around by ~ 1C)
            total = 0
            for i in range(interval):
                val = readAnalog(1)
                if val: # will be empty if an exception occurred
                    total += val
                time.sleep(1)    
                
            # MAX_ANALOG is equivalent to 3.3V
            mV = (total * 3300) / (MAX_ANALOG * interval) # interval = num readings in total
            # BCP7200A returns 500mV at 0C, and 10mV for each 0.1C above 0
            temperature = float((mV - 500) / 10.0)
            # add reading to queue
            resultsQueue.put(("T", temperature))
        except:
            log.exception('Error in readAnalog')
        time.sleep(interval)
    
def updateDisplay():    
    global lastUpdateTime
    while 1 == 1:
        try:
            if TIME_UPDATE_INTERVAL and (datetime.datetime.now() - lastUpdateTime).seconds >= TIME_UPDATE_INTERVAL:
                #if Debug:
                #    print("writing time: " + datetime.datetime.now().strftime("%m/%d - %H:%M:%S"))
                setCursorPos(TIME_DISPLAY_ROW, 1, True)                
                writeToDisplay(datetime.datetime.now().strftime("%m/%d - %H:%M:%S"))
                
            lastUpdateTime = datetime.datetime.now()
            
            # check the queue for new readings from sensor
            try:
                if resultsQueue.empty():
                    #if Debug:
                    #    print("nothing in queue")
                    # nothing in queue, so take a nap
                    time.sleep(1)
                else:
                    result = resultsQueue.get(False) # set blocking to False - will raise Empty exception if nothing there
                    if (len(result) == 2):
                        if Debug:
                            print("got item from queue: " + result[0])
                        if result[0] == "B":
                            if Debug:
                                print "before call to setBrightness " + str(result[1])
                            setBrightness(result[1])
                        elif result[0] == "T":
                            setCursorPos(TEMPERATURE_DISPLAY_ROW, 1, True)
                            writeToDisplay(str(result[1]) + "C")
                        else:
                            print("unexpected sensor type in queue: " + result[0])
                    else:
                        print("invalid item in queue, len = " + str(len(result)))
                    
            #except Empty:
                #if Debug:
                    #print("nothing in queue")
                ## nothing in queue, so take a nap
                #time.sleep(1)
            except:
                log.exception('Error reading from queue' );
        except:
            log.exception('Error in updateDisplay')
            
logging.basicConfig(level=logging.ERROR,
                    format='%(asctime)s %(levelname)s %(message)s',
                    filename='serdisplay.log')
log = logging.getLogger()        

initializeAnalogIn([0, 1])           
initializeDisplay(LCD_NUM_ROWS, LCD_NUM_COLS)

# Note - cannot start > 2 threads if parameters are passed?
Thread(target=updateDisplay).start()
Thread(target=readTemperature).start()
Thread(target=readBrightness).start()
