
%%---------------------------- Machine Learning Algorithm ----------------------------%%

%% Initialization
clear all; close all; clc

% Cargamos los datos que representan la informacion sensada por el robot.

%Estoy usando estoy datos, pero ya randomizados



%sonar_data_aux = [15 17 20 22 25 30 35 40 45 50 70 85; 20 23 29 32 37 42 49 54 61 67 93 106];

#IR_data_aux = [10 12 16 20 30 33 40 50 54 60 70 75 80; 2.324908 1.934872 1.490843 1.244249 0.848571 0.772821 0.660806 0.523810 0.529451 0.469817 0.412601  0.391648 0.392454];

#IR_data_aux = [10 10 10 10 10 12 12 12 12 12 16 16 16 16 16 20 20 20 20 20 30 30 30 30 30 33 33 33 33 33 40 40 40 40 40 50 50 50 50 50 54 54 54 54 54 60 60 60 60 60 70 70 70 70 70 75 75 75 75 75 80 80 80 80 80 ; 2.324908 2.314432 2.313627 2.312015 2.312821 1.934872 1.934066 1.930843 1.926813 1.929231 1.490843 1.490037 1.491648 1.491648 1.494066 1.244249 1.241026 1.241832 1.242638 1.286154 0.848571 0.852601 0.851795 0.854213 0.846154 0.772821 0.773626 0.775238 0.815531 0.775238 0.660806 0.660806 0.704322 0.661612 0.661612 0.523810 0.545568 0.547985 0.546374 0.529451 0.529451 0.546374 0.556044 0.510110 0.489963 0.469817 0.473040 0.529451 0.472234 0.471429 0.412601 0.455311 0.435971 0.414212 0.415824 0.391648 0.453700 0.448864 0.408571 0.410183 0.392454 0.390843 0.430330 0.389231 0.391648];

fprintf('Cargando datos... \n \n');
data = load('random_data.txt');
m = length(data(:,1))

% Defino el largo de cada set de datos para procesar
train_set = ceil(65*length(data(:,1))/100)
val_set   = floor(35*length(data(:,1))/100)
%test_set  = floor(25*length(data(:,1))/100)

[fil col] = size(data);
data_sens = col-1;

X = data (:, 1:data_sens);
y = data (:, col);
X = [X.^-1];

Xtrain = X(1:train_set, :); ytrain = y(1:train_set);
Xval = X(train_set + 1 : train_set + val_set, :); yval = y(train_set + 1 : train_set + val_set);
%Xtest = data(val_set + train_set + 1:end, :); ytest = y(val_set + train_set + 1 : end);
[Xtrain, mu, sigma] = featureNormalize(Xtrain);
Xtrain = [ones(train_set, 1), Xtrain];

Xval = bsxfun(@minus, Xval, mu);
Xval = bsxfun(@rdivide, Xval, sigma);
Xval = [ones(val_set, 1), Xval];

printf("mu:")
mu

%test_set = length(Xtest(:,1));
%Xtest = bsxfun(@minus, Xtest, mu);
%Xtest = bsxfun(@rdivide, Xtest, sigma);
%Xtest = [ones(test_set, 1), Xtest];

fprintf('Datos cargados, presione una tecla para continuar \n');
pause;

% Seteamos el parametro de regularizacion, si es muy grande produce bias.
%De encontrarse un termino medio para evitar variance sin ser demasiado grande
lambda = 0;

% Esta funcion se encarga de llamar a la funcion que entrena los parametros y calcula el costo
%==================================================================================================%
%    USAR UNA VEZ ELEGIDAS LA CANTIDAD DE MUESTRAS Y EL LAMBDA, PARA ENTRENAR LOS THETA FINALES    %
theta = trainLinearReg(Xtrain, ytrain, lambda)
%==================================================================================================%

#Valores para aplicar a las "x" a la ecuacion resultante, dado que los parametros fueron aprendidos con los valores normalizados
mu
sigma

[error_train, error_val] = learningCurve(Xtrain, ytrain, Xval, yval, lambda);

figure(1);
plot(1:train_set, error_train, 1:train_set, error_val);
title('Learning curve for linear regression');
legend('Train', 'Cross Validation');
#axis([0 10 0 200]);
xlabel('Number of training examples');
ylabel('Error');

[lambda_vec, error_train, error_val] = validationCurve(Xtrain, ytrain, Xval, yval);

figure(2);
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');


