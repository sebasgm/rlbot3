; Auto-generated. Do not edit!


(cl:in-package rlbot3-msg)


;//! \htmlinclude motorsPWM.msg.html

(cl:defclass <motorsPWM> (roslisp-msg-protocol:ros-message)
  ((pwm_enable
    :reader pwm_enable
    :initarg :pwm_enable
    :type cl:boolean
    :initform cl:nil)
   (pwm_l
    :reader pwm_l
    :initarg :pwm_l
    :type cl:fixnum
    :initform 0)
   (pwm_r
    :reader pwm_r
    :initarg :pwm_r
    :type cl:fixnum
    :initform 0))
)

(cl:defclass motorsPWM (<motorsPWM>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motorsPWM>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motorsPWM)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rlbot3-msg:<motorsPWM> is deprecated: use rlbot3-msg:motorsPWM instead.")))

(cl:ensure-generic-function 'pwm_enable-val :lambda-list '(m))
(cl:defmethod pwm_enable-val ((m <motorsPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rlbot3-msg:pwm_enable-val is deprecated.  Use rlbot3-msg:pwm_enable instead.")
  (pwm_enable m))

(cl:ensure-generic-function 'pwm_l-val :lambda-list '(m))
(cl:defmethod pwm_l-val ((m <motorsPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rlbot3-msg:pwm_l-val is deprecated.  Use rlbot3-msg:pwm_l instead.")
  (pwm_l m))

(cl:ensure-generic-function 'pwm_r-val :lambda-list '(m))
(cl:defmethod pwm_r-val ((m <motorsPWM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rlbot3-msg:pwm_r-val is deprecated.  Use rlbot3-msg:pwm_r instead.")
  (pwm_r m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motorsPWM>) ostream)
  "Serializes a message object of type '<motorsPWM>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pwm_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pwm_l)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pwm_l)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pwm_r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pwm_r)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motorsPWM>) istream)
  "Deserializes a message object of type '<motorsPWM>"
    (cl:setf (cl:slot-value msg 'pwm_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pwm_l)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pwm_l)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pwm_r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pwm_r)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motorsPWM>)))
  "Returns string type for a message object of type '<motorsPWM>"
  "rlbot3/motorsPWM")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motorsPWM)))
  "Returns string type for a message object of type 'motorsPWM"
  "rlbot3/motorsPWM")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motorsPWM>)))
  "Returns md5sum for a message object of type '<motorsPWM>"
  "7b3d28eca08e2b533d7dacc9d4ded039")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motorsPWM)))
  "Returns md5sum for a message object of type 'motorsPWM"
  "7b3d28eca08e2b533d7dacc9d4ded039")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motorsPWM>)))
  "Returns full string definition for message of type '<motorsPWM>"
  (cl:format cl:nil "bool pwm_enable~%uint16 pwm_l~%uint16 pwm_r~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motorsPWM)))
  "Returns full string definition for message of type 'motorsPWM"
  (cl:format cl:nil "bool pwm_enable~%uint16 pwm_l~%uint16 pwm_r~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motorsPWM>))
  (cl:+ 0
     1
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motorsPWM>))
  "Converts a ROS message object to a list"
  (cl:list 'motorsPWM
    (cl:cons ':pwm_enable (pwm_enable msg))
    (cl:cons ':pwm_l (pwm_l msg))
    (cl:cons ':pwm_r (pwm_r msg))
))
