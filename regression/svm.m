function [w, num] = svm(X, y)
%SVM Support vector machine.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           num:  number of support vectors
%

% YOUR CODE HERE

[P, N] = size(X);

x = [ones(1, N);X];
y = y .* -1;
A = (x .* y)';

w = quadprog(eye(P+1),zeros(1+P, 1),A,[ones(N, 1)] .* -1);
[row, column] = find((abs(A * w) - 1) < 0.001);
num = length(column);

end
