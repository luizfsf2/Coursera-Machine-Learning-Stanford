function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


values = [.001, .003, .01, .03, .1, .3, 1, 3, 10, 30];
result = zeros(length(values)^2, 3);
r_idx = 1;

for c_idx = 1:length(values)
  for sigma_idx = 1:length(values)
     
     C = values(c_idx);
     sigma = values(sigma_idx);
     
     model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
     predictions = svmPredict(model, Xval);
     
     result(r_idx, 1) = C;
     result(r_idx, 2) = sigma;
     result(r_idx, 3) = mean(double(predictions ~= yval));
     r_idx++
  end
end


scatter3(result(:, 1), result(:, 2), result(:, 3), markerstyle='0');
[_, best_idx] = min(result(:, 3));
C = result(best_idx, 1);
sigma = result(best_idx, 2);

% =========================================================================

end
