% You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.

%% Part1: Preceptron
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = nTrain * 100; % number of test data

sumIter = 0;
train_error = 0;
test_error = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain + nTest);
    [w_g, iter] = perceptron(X(:, 1:nTrain), y(:, 1:nTrain));
    
    % Compute training, testing error
    [P,N] = size(X);
    x = [ones(1,N); X];
    [row, column] = find(sign(w_g' * x) - y);
    train_error = train_error + length(find(column < nTrain+1));
    test_error = test_error + length(find(column >nTrain));
    sumIter = iter + sumIter; % Sum up number of iterations
end

avgIter = sumIter / nRep;
E_train = train_error / (nTrain * nRep);
E_test = test_error / (nTest * nRep);


fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
fprintf('Average number of iterations is %3.2f.\n', avgIter);
plotdata(X(:, 1:nTrain), y(:, 1:nTrain), w_f, w_g, 'Pecertron Train');
plotdata(X(:, nTrain+1: nTrain+nTest), y(:, nTrain+1:nTrain+nTest), w_f, w_g, 'Pecertron Test');

%% Part2: Preceptron: Non-linearly separable case
nTrain = 100; % number of training data
[X, y, w_f] = mkdata(nTrain, 'noisy');
[w_g, iter] = perceptron(X, y);


%% Part3: Linear Regression
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = nTrain * 100;

train_error = 0;
test_error = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain + nTest);
    w_g = linear_regression(X(:, 1:nTrain), y(:, 1:nTrain));
    
    % Compute training, testing error
    [P,N] = size(X);
    x = [ones(1,N); X];
    [row, column] = find(sign(w_g' * x) - y);
    train_error = train_error + length(find(column < nTrain+1));
    test_error = test_error + length(find(column >nTrain));
end
E_train = train_error / (nTrain * nRep);
E_test = test_error / (nTest * nRep);

fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X(:, 1:nTrain), y(:, 1:nTrain), w_f, w_g, 'Linear Regression Train');
plotdata(X(:, nTrain+1: nTrain+nTest), y(:, nTrain+1:nTrain+nTest), w_f, w_g, 'Linear Regression Test');

%% Part4: Linear Regression: noisy
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = nTrain * 100;

train_error = 0;
test_error = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain+nTest, 'noisy');
    w_g = linear_regression(X(:, 1:nTrain), y(:, 1:nTrain));
    
    % Compute training, testing error
    [P,N] = size(X);
    x = [ones(1,N); X];
    [row, column] = find(sign(w_g' * x) - y);
    train_error = train_error + length(find(column < nTrain+1));
    test_error = test_error + length(find(column >nTrain));
end
E_train = train_error / (nTrain * nRep);
E_test = test_error / (nTest * nRep);

fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X(:, 1:nTrain), y(:, 1:nTrain), w_f, w_g, 'Linear Regression Train: noisy');
plotdata(X(:, nTrain+1: nTrain+nTest), y(:, nTrain+1:nTrain+nTest), w_f, w_g, 'Linear Regression Test: noisy');

%% Part5: Linear Regression: poly_fit
load('poly_train', 'X', 'y');
load('poly_test', 'X_test', 'y_test');
w = linear_regression(X, y)
% Compute training, testing error
train_error = 0;
[P,N] = size(X);
x = [ones(1,N); X];
[row, column] = find(sign(w' * x) - y);
train_error = train_error + length(column);
E_train = train_error / N;


test_error = 0;
[P,N] = size(X_test);
x = [ones(1,N); X_test];
[row, column] = find(sign(w' * x) - y_test);
test_error = test_error + length(column);
E_test = test_error / N;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);

plotdata(X, y, w, w, 'Linear Regression Train: ploy fit');
plotdata(X_test, y_test, w, w, 'Linear Regression Test: ploy fit');

%% poly_fit with transform
X_t = [X;X(1,:).*X(2,:);X.^2]; % CHANGE THIS LINE TO DO TRANSFORMATION
X_test_t = [X_test;X_test(1,:).*X_test(2,:);X_test .^2]; % CHANGE THIS LINE TO DO TRANSFORMATION
w = linear_regression(X_t, y)

% Compute training, testing error
train_error = 0;
[P,N] = size(X_t);
x = [ones(1,N); X_t];
[row, column] = find(sign(w' * x) - y);
train_error = train_error + length(column);
E_train = train_error / N;


test_error = 0;
[P,N] = size(X_test_t);
x = [ones(1,N); X_test_t];
[row, column] = find(sign(w' * x) - y_test);
test_error = test_error + length(column);
E_test = test_error / N;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);

%% Part6: Logistic Regression
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = nTrain * 100;

train_error = 0;
test_error = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain+nTest);
    w_g = logistic(X(:, 1:nTrain), y(:, 1:nTrain));
    % Compute training, testing error
    [P,N] = size(X);
    x = [ones(1,N); X];
    [row, column] = find(sign(w_g' * x) - y);
    train_error = train_error + length(find(column < nTrain+1));
    test_error = test_error + length(find(column >nTrain));
end

E_train = train_error / (nTrain * nRep);
E_test = test_error / (nTest * nRep);
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X(:, 1:nTrain), y(:, 1:nTrain), w_f, w_g, 'Logistic Regression Train');
plotdata(X(:, nTrain+1:nTrain+nTest), y(:, nTrain+1:nTrain+nTest), w_f, w_g, 'Logistic Regression Test');

%% Part7: Logistic Regression: noisy
nRep = 100; % number of replicates
nTrain = 100; % number of training data
nTest = 10000; % number of training data

train_error = 0;
test_error = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain+nTest, 'noisy');
    w_g = logistic(X, y);
    % Compute training, testing error
    [P,N] = size(X);
    x = [ones(1,N); X];
    [row, column] = find(sign(w_g' * x) - y);
    train_error = train_error + length(find(column < nTrain+1));
    test_error = test_error + length(find(column >nTrain));
end

E_train = train_error / (nTrain * nRep);
E_test = test_error / (nTest * nRep);
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X(:, 1:nTrain), y(:, 1:nTrain), w_f, w_g, 'Logistic Regression Train: noisy');
plotdata(X(:, nTrain+1:nTrain+nTest), y(:, nTrain+1:nTrain+nTest), w_f, w_g, 'Logistic Regression Test: noisy');

%% Part8: SVM
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
nTest = nTrain * 100;

train_error = 0;
test_error = 0;
sv_sum = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain+nTest);
    [w_g, num_sv] = svm(X(:, 1:nTrain), y(:, 1:nTrain));
    % Compute training, testing error
    [P,N] = size(X);
    x = [ones(1,N); X];
    [row, column] = find(sign(w_g' * x) - y);
    train_error = train_error + length(find(column < nTrain+1));
    test_error = test_error + length(find(column >nTrain));
    
    % Sum up number of support vectors
    sv_sum = sv_sum + num_sv;
end

E_train = train_error / (nTrain * nRep);
E_test = test_error / (nTest * nRep);
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
fprintf('Number of support vectors is %f.\n', sv_sum/nRep); 
plotdata(X(:, 1:nTrain), y(:, 1:nTrain), w_f, w_g, 'SVM Training');
plotdata(X(:, nTrain+1: nTrain + nTest), y(:, nTrain+1:nTrain + nTest), w_f, w_g, 'SVM Test');
