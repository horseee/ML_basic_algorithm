%% Ridge Regression
load('digit_train', 'X', 'y');
%Do feature normalization
X = zscore(X);

%% Do LOOCV
lambdas = [1e-3, 1e-2, 1e-1, 0, 1, 1e1, 1e2, 1e3];
lambda = 0;

min_Error = size(X, 2);
w_min_Error = zeros(size(X, 1) + 1, 1);
for i = 1:length(lambdas)
    E_val = 0;
    for j = 1:size(X, 2)
        X_ = [X(:, 1:j-1), X(:, j+1:size(X, 2))]; y_ = [y(:, 1:j-1), y(:, j+1:size(y, 2))]; % take point j out of X
        w = ridge(X_, y_, lambdas(i));
        if (sign(w' * [1; X(:, j)]) - y(:, j)) ~= 0
            E_val = E_val + 1;
        end
    end
    % Update lambda according validation error
    fprintf("lambda: %f, E_val = %d\n", lambdas(i), E_val);
    square_root_sum = sum(w.^2);
    fprintf("sum of square(w) = %.6f\n", square_root_sum);
    if (E_val < min_Error) 
        w_min_Error = w;
        min_Error = E_val;
    end
    % Compute Training error
    error_val = length(find(sign(w' * [ones(1, size(X, 2)); X]) - y));
    error_rate = error_val / size(X, 2);
    fprintf("error_rate = %.6f\n", error_rate);
end


%% Compute Test error
load('digit_test', 'X_test', 'y_test');
% Do feature normalization
X_test = zscore(X_test);
% Compute test error
error_val = length(find(sign(w_min_Error' * [ones(1, size(X_test, 2)); X_test]) - y_test));
error_rate = error_val / size(X_test, 2);
fprintf("error_rate = %.6f", error_rate);

%% Logistic
lambdas = [1e-3, 1e-2, 1e-1, 0, 1, 1e1, 1e2, 1e3];
lambda = 0;

min_Error = size(X, 2);
w_min_Error = zeros(size(X, 1) + 1, 1);
for i = 1:length(lambdas)
    E_val = 0;
    for j = 1:size(X, 2)
        X_ = [X(:, 1:j-1), X(:, j+1:size(X, 2))]; y_ = [y(:, 1:j-1), y(:, j+1:size(y, 2))]; % take point j out of X
        w = logistic_r(X_, y_, lambdas(i));
        if (sign(w' * [1; X(:, j)]) - y(:, j)) ~= 0
            E_val = E_val + 1;
        end
    end
    % Update lambda according validation error
    fprintf("lambda: %f, E_val = %d\n", lambdas(i), E_val);
    square_root_sum = sum(w.^2);
    fprintf("sum of square(w) = %.6f\n", square_root_sum);
    if (E_val < min_Error) 
        w_min_Error = w;
        min_Error = E_val;
    end
    % Compute Training error
    error_val = length(find(sign(w' * [ones(1, size(X, 2)); X]) - y));
    error_rate = error_val / size(X, 2);
    fprintf("training error_rate = %.6f\n", error_rate);
    
    % Compute Testing error
    error_val = length(find(sign(w' * [ones(1, size(X_test, 2)); X_test]) - y_test));
    error_rate = error_val / size(X_test, 2);
    fprintf("testing error_rate = %.6f\n\n", error_rate);
    
end