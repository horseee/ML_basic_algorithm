function p = gaussian_pos_prob(X, Mu, Sigma, Phi)
%GAUSSIAN_POS_PROB Posterior probability of GDA.
%   p = GAUSSIAN_POS_PROB(X, Mu, Sigma) compute the posterior probability
%   of given N data points X using Gaussian Discriminant Analysis where the
%   K gaussian distributions are specified by Mu, Sigma and Phi.
%
%   Inputs:
%       'X'     - M-by-N matrix, N data points of dimension M.
%       'Mu'    - M-by-K matrix, mean of K Gaussian distributions.
%       'Sigma' - M-by-M-by-K matrix (yes, a 3D matrix), variance matrix of
%                   K Gaussian distributions.
%       'Phi'   - 1-by-K matrix, prior of K Gaussian distributions.
%
%   Outputs:
%       'p'     - N-by-K matrix, posterior probability of N data points
%                   with in K Gaussian distributions.

N = size(X, 2);
M = size(X, 1);
K = length(Phi);
p = zeros(N, K);

evi = zeros(N, K);
pre = zeros(K);
invSigma = zeros(M, M, K);

for k=1:1:K
    pre(k) = 1 / (2 * pi) / (det(Sigma(:, :, k)) ^ (1/2));
    invSigma(:, :, k) = inv(Sigma(:, :, k));
end

for n = 1:1:N
    l_sum = 0;
    for k = 1:1:K
        exp_cal = - 0.5 * (X(:, n) - Mu(:, k))' * invSigma(:, :, k) * (X(:, n) - Mu(:, k));
        evi(n, k) = pre(k) * exp(exp_cal);
        l_sum = l_sum + evi(n, k) * Phi(k);
    end
    
    for k = 1:1:k
        p(n, k) = evi(n, k) * Phi(k) / l_sum;
    end
    disp(n);
end



    



