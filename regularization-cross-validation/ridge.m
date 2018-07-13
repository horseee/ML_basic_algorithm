function w = ridge(X, y, lambda)
%RIDGE Ridge Regression.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%           lambda: regularization parameter.
%
%   OUTPUT: w: learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE

X = [ones(1, size(X, 2)); X];
w = pinv((X * X' + lambda * eye(size(X, 1)))) * X * y';


end
