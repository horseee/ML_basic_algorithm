function [w, iter] = perceptron(X, y)
%PERCEPTRON Perceptron Learning Algorithm.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           iter: number of iterations
%

[P,N] = size(X);
w = zeros(P+1, 1);
iter = 0;
x = [ones(1,N); X];

while true
    ResMatrix = sign(w' * x) - y;
    [row, column] = find(ResMatrix);
    if isempty(column)
        break;
    end
    w = w + (x(:, column(1)) * y(:, column(1))');
    iter = iter + 1;
end



end
