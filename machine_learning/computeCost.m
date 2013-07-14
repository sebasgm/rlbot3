function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

% Construyo una funcion que me devuelve una funcion de costo regularizada, y su correspondiente gradiente,
% para un problema de Logistic regresion (clasificacion). De modo que esta funcion puede ser utilizada
% por otras funciones de minimización que se valgan de este algoritmo, (la forma mas elemental seria iterar
% manualmente sobre el gradiente, para ir actualizando los theta).
% Esta funcion puede utilizarse para un clasificador binario, como también para un problema de oneVsAll
% donde se tendria un h_theta(x) por cada "clase", y por ende un set "theta" por cada "h".
 

   reg_theta = [0; theta([2:end])]; %Vector de largo theta, con un cero en la posicion inicial, y theta en el resto de las posiciones
   %theta0 = [1; zeros((length(theta)-1),1)] %Construyo un vector de largo theta, que tiene un 1 en la posicion inicial, y el resto cero

   h = X*theta;  %Lo computo una sola vez para no repetir una operacion que es pesada, varias veces en los calculos

   J = (1/(2*m))*(sum((h - y).^2)) + ((lambda./(2*m))*(reg_theta'*reg_theta));
   
   grad = 1/m*(((h - y)'*X)' + (lambda*reg_theta));




% =============================================================

end
