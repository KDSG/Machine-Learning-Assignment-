function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
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
H = ((1+exp(-1*(theta' * X')')).^(-1));


% J= ( -1 *((y'*log(H))+((1-y)'*log(1-H)))/(m));
% H = H(2:m,1);          
l= length(theta);

reg = (sum(theta(2:l,1).*theta(2:l,1)));
reg =(lambda/(2*m))*reg;
J = ( -1 *((y'*log(H))+((1-y)'*log(1-H)))/(m))+ reg;



grad = (((H-y)'*X)/(m));
for i= 2:l
reg1(i) = (lambda/m)*(theta(i));
grad(i) = grad(i) + reg1(i);
end
% =============================================================

end
