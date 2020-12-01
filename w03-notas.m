

%g = 1 / (1 + e^-z)

function J = computeLRCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

J =  1/(2*m) * sum((((X * theta) - y).^2));

% =========================================================================

end

function [yPred] = computeLinRegHipothesis(X, theta)
  yPred = (X * theta);
end 

function [theta, J_history] = gradientDescent(hipothesis, X, y, theta, alpha, num_iters, costFunction)
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
      
      theta = theta - alpha * 1/m * X' * (hipothesis(X, theta) - y);
      % (X * theta)           =>   X: matrix m x n  / theta: vetor n x 1  / resultado r1: vetor m x 1
      % (X * theta) - y)      =>  r1: vetor m x 1   / y: vetor m X 1      / resutlado r2: vetor m x 1
      % X' * (X * theta) - y) =>  X': matriz n x m  / r2: vetor m X 1     / resultado r3: vetor n x 1
      
      % ============================================================

      J_history(iter) = costFunction(X, y, theta);

  end

end

function [theta, J_history] = linearRegressionGD(X, y, theta, alpha, num_iters)
  [theta, J_history] = gradientDescent(@computeLinRegHipothesis, X, y, theta, alpha, num_iters, @computeLRCost);
end

function runLRGradient()

  data = load('./w02-g-ex1/ex1/ex1data1.txt');
  y = data(:, 2);
  m = length(y); % number of training examples

  X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
  theta = zeros(2, 1); % initialize fitting parameters

  % Some gradient descent settings
  iterations = 1500;
  alpha = 0.01;
  theta = linearRegressionGD(X, y, theta, alpha, iterations);


  % print theta to screen
  fprintf('Theta found by gradient descent:\n');
  fprintf('%f\n', theta);
  fprintf('Expected theta values (approx)\n');
  fprintf(' -3.6303\n  1.1664\n\n');

end  
  
function [yPred] = computeLogRegHipothesis(X, theta)
  
  z = (X * theta);
  yPred = 1 ./ (1  + e.^(z));
  
end  
  
  
  
h = computeLogRegHipothesis(X, theta);
m = length(y); % number of training examples
J = 1/m -y * log(h) - (1-y)*log(1-h); 
  
  
function [a] = test_func_as_arg(f)
  a = 1;
  f(a);  
end

function [a] = my_print(a)
  fprintf('este eh o numero %d',a);  
end
 

test_func_as_arg(@my_print)

