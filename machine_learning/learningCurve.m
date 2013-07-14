function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)
%LEARNINGCURVE Generates the train and cross validation set errors needed 
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE(X, y, Xval, yval, lambda) returns the train and
%       cross validation set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train and 
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%
%   In this function, you will compute the train and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the cross validation errors in error_val. 
%               The vector numex_vec contains the number of training 
%               examples to use for each calculation of training error and 
%               cross validation error, i.e, error_train(i) and 
%               error_val(i) should give you the errors
%               obtained after training on i examples.
%
% Note: You should evaluate the training error on the first i training
%       examples (i.e., X(1:i, :) and y(1:i)).
%
%       For the cross-validation error, you should instead evaluate on
%       the _entire_ cross validation set (Xval and yval).
%
% Note: If you are using your cost function (linearRegCostFunction)
%       to compute the training and cross validation error, you should 
%       call the function with the lambda argument set to 0. 
%       Do note that you will still need to use lambda when running
%       the training to obtain the theta parameters.
%
% Hint: You can loop over the examples with the following:
%
%       for i = 1:m
%           % Compute train/cross validation errors using training examples 
%           % X(1:i, :) and y(1:i), storing the result in 
%           % error_train(i) and error_val(i)
%           ....
%           
%       end
%

% ---------------------- Sample Solution ----------------------

    lambda_aux = 0;
     
    for i=1:m,
    
        [theta, iter] = trainLinearReg(X(1:i,:), y(1:i), lambda); %Computo, para cada tamanio del training set, los parametros theta del
                                                          %modelo. Luego los uso para calcular el error.
                                                          %Cada vez que itera cambia la cantidad de muestras
                
        %Computo el error con la funcion de costo que se implemento previamente,
        %pero en este caso lo hago sin termino de regulacion (con lambda = 0). Ademas no uso el valor de gradiente que
        %devuelve la funcion, porque no estoy minimizando sino solo obteniendo el valor del error.

        %El error lo computo para cada conjunto de theta obtenidos (es decir, en funcion de las muestras)
        %Esto es porque nos interesa particularmente poder tener una idea de como varia el error en funcion
        %del tamanio del set de muestras, para determinar si tenemos un problema de Bias o Variance.
        error_train(i) = linearRegCostFunction(X(1:i,:), y(1:i), theta, lambda_aux);

        %A diferencia del training set, el error en para cada conjunto de theta, en el crossvalidation set, se calcula
        %sobre todas las muestras.    
        error_val(i) = linearRegCostFunction(Xval, yval, theta, lambda_aux);
    end

    error_val = error_val(1:m);        

    %NOTA: El grafico de este ejercicio va a mostrar que las curvas de error de ambos set de datos, terminan juntandose
    %      y que se vuelven asintoticos, no mejoran para muchas muestras. Estos denota High Bias. Es decir, no sirve un
    %      un modelo lineal para ajustar al set de datos que tenemos.        
    






% -------------------------------------------------------------

% =========================================================================

end
