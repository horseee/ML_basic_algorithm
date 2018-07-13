function w = logistic(X, y)
%LR Logistic Regression.
%
%   INPUT:  X:   training sample features, P-by-N matrix.
%           y:   training sample labels, 1-by-N row vector.
%
%   OUTPUT: w    : learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE

[P, N] = size(X);
w = zeros(P+1, 1);
x = [ones(1, N);X];
for i=1:1:N
    if (y(i) == -1)
        y(i) = 0;
    end
end
alpha = 0.01;

iter = 0;
while true
    iter = iter + 1;
    error = sigmoid(w' * x) - y;
    if (norm(error) < 1 | iter > 10000)
        break
    else
        w = w - alpha * x * error';
    end
end


end



