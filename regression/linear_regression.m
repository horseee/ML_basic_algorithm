function w = linear_regression(X, y)
%LINEAR_REGRESSION Linear Regression.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w: learned perceptron parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE

[P, N] = size(X);
w_temp = zeros(P+1, 2);
x = [ones(1, N); X];
x = x';

Y = zeros(N, 2);
for i=1:1:N
    if y(i) == -1
        Y(i, 1) = 1;
    else
        Y(i, 2) = 1;
    end   
end

w_temp = inv(x' * x) * x' * Y;

w = zeros(P+1, 1);
w = w_temp(:, 2) - w_temp(:, 1);

end
