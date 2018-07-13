function l = likelihood(x)
%LIKELIHOOD Different Class Feature Liklihood 
%
%   INPUT:  x, features of different class, C-By-N vector
%           C is the number of classes, N is the number of different feature
%
%   OUTPUT: l,  likelihood of each feature(from smallest feature to biggest feature) given by each class, C-By-N matrix
%

[C, N] = size(x);
l = zeros(C, N);

sum_x = sum(x, 2);
l(1, 1:N) = x(1, 1:N) / sum_x(1);
l(2, 1:N) = x(2, 1:N) / sum_x(2);

%TODO

end
