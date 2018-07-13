% You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.

%%load data
load('data');
all_x = cat(2, x1_train, x1_test, x2_train, x2_test);
range = [min(all_x), max(all_x)];
train_x = get_x_distribution(x1_train, x2_train, range);
test_x = get_x_distribution(x1_test, x2_test, range);

%% Part1 likelihood: 
l = likelihood(train_x);

bar(range(1):range(2), l');
xlabel('x');
ylabel('P(x|\omega)');
axis([range(1) - 1, range(2) + 1, 0, 0.5]);

%TODO
%compute the number of all the misclassified x using maximum likelihood decision rule

[C, N] = size(train_x);
sym missclass_num;
missclass_num = 0;
for i=1:1:N
    if (l(1, i) < l(2, i)) 
        missclass_num = test_x(1, i) + missclass_num;
    else
        missclass_num = test_x(2, i) + missclass_num;
    end
end
fprintf("Likelihood misclassfied number = %d\n", missclass_num)

%% Part2 posterior:
p = posterior(train_x);

bar(range(1):range(2), p');
xlabel('x');
ylabel('P(\omega|x)');
axis([range(1) - 1, range(2) + 1, 0, 1.2]);

[C, N] = size(test_x);
sym missclass_num;
missclass_num = 0;
for i=1:1:N
    if (p(1, i) < p(2, i)) 
        missclass_num = test_x(1, i) + missclass_num;
    else
        missclass_num = test_x(2, i) + missclass_num;
    end
end
fprintf("Posterior misclassified number = %d\n", missclass_num)

%% Part3 risk:
risk = [0, 1; 2, 0];
con_risk = zeros(C, N);
for i= 1:1:C
    for j= 1:1:N
        con_risk(i, j) = p(1, j) * risk(i, 1) +  p(2 ,j) * risk(i, 2);
    end
end

sym R;
R = 0;
for j= 1:1:N
    R = R + min(con_risk(1, j), con_risk(2, j))
end
fprintf("Minimal total risk = %6f\n", R)
