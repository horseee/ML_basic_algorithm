function sigx = sigmoid(x)
sigx = 1 ./ (1 + exp(-1 .* x));
end