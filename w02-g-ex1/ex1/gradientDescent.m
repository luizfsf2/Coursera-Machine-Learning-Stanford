function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    % Save the cost J in every iteration    
    
    theta = theta - alpha * 1/m * ((X * theta) - y)' X';
    % (X * theta)           =>   X: matrix m x n  / theta: vetor n x 1  / resultado r1: vetor m x 1
    % (X * theta) - y)      =>  r1: vetor m x 1   / y: vetor m X 1      / resutlado r2: vetor m x 1
    % X' * (X * theta) - y) =>  X': matriz n x m  / r2: vetor m X 1     / resultado r3: vetor n x 1
    
    % ============================================================

    J_history(iter) = computeCost(X, y, theta);

end

end
