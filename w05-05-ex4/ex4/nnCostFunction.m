function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

%{
A1 = [ones(m, 1) X];
Z2 = A1 * Theta1';
A2 = sigmoid(Z2);

% layer 2
A2 = [ones(size(A2, 1), 1) A2];
Z3 = A2 * Theta2';
A3 = sigmoid(Z3);

HTheta = A3; # m x num_labels
%}

HTheta = zeros(m, num_labels);
for t = 1:m
  a1 = X(t, :)';
  % ffw propagation
  a1 = [1; a1];
  z2 = Theta1 * a1;
  a2 = sigmoid(z2);
  a2 = [1; a2];
  z3 = Theta2 * a2;  
  a3 = sigmoid(z3);
  HTheta(t, :) = a3;
endfor  

%{ 
=========== forma escalar=============
for i = 1 : m
  for k = 1 : num_labels   
    yReal = y(i) == k;
    yPred = HTheta(i,k);
    J += -yReal * log(yPred) - (1-yReal)*log(1-yPred);
  endfor
endfor
J = J / m
%}

J = 0;
for k = 1 : num_labels  
  yReal = y == k;
  yPred = HTheta(:,k);
  J += -yReal' * log(yPred) - (1-yReal)' * log(1-yPred);  
endfor

J = J / m;


reg = (lambda / ( 2 * m)) * (sum(sum(Theta1(:, 2:end) .^ 2),2) + sum(sum(Theta2(:, 2:end) .^ 2),2));


J += reg;

yk = zeros(num_labels, m);
for t = 1:m
  yk(y(t), t) = 1; % se y(m) = 5, yk = 0; 0; 0; 0; 1; 0; 0; 0; 0; 0;
endfor

Delta2 = 0;
Delta1 = 0;
for t = 1:m
  a1 = X(t, :)';
  % ffw propagation
  a1 = [1; a1];
  z2 = Theta1 * a1;
  a2 = sigmoid(z2);
  a2 = [1; a2];
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);
  
  % backpropagation
  d3 = a3 - yk(:, t);
  d2 = (Theta2' * d3) .* (a2.*(1-a2)); #sigmoidGradient(a2);
  d2 = d2(2:end);     
     
  Delta2 = Delta2 + d3 * a2';
  Delta1 = Delta1 + d2 * a1';
endfor  

Theta2_grad = Delta2 / m;
Theta1_grad = Delta1 / m;


% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
