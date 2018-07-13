function p = posterior(x)
%POSTERIOR Two Class Posterior Using Bayes Formula
%
%   INPUT:  x, features of different class, C-By-N vector
%           C is the number of classes, N is the number of different feature
%
%   OUTPUT: p,  posterior of each class given by each feature, C-By-N matrix
%

[C, N] = size(x);
l = likelihood(x);
total = sum(sum(x));

% prior probability
prior = zeros(C, 1);
prior = sum(x, 2) / total;

% evidence
evidence = zeros(1, N);
evidence = sum(x, 1) / total;

% posterior
p = zeros(C, N);
for i= 1:1:C
    for j= 1:1:N
        p(i, j) = l(i, j) * prior(i) / evidence(j);
    end
end
 
end
