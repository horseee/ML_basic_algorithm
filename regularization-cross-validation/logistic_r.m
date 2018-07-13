function w = logistic_r(X, y, lambda)
%LR Logistic Regression.
%
%   INPUT:  X:   training sample features, P-by-N matrix.
%           y:   training sample labels, 1-by-N row vector.
%           lambda: regularization parameter.
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
alpha = 0.001;

iter = 0;
while true
    iter = iter + 1;
    error = sigmoid(w' * x) - y;
    if (iter > 5000)
        break
    else
        %w(1, :) = w(1, :) - alpha * (x * error')
        %w(2:P+1, :) = w(2:P+1, :) - alpha * (x * error' - lambda .* w(2:P+1, :));
        w = w - alpha * sum((x .* error), 2);
        w(2:P+1, :) =  w(2:P+1, :) - alpha * (lambda .* w(2:P+1, :));
    end
end

end
