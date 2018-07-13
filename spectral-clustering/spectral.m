function idx = spectral(W, k, s)
%SPECTRUAL spectral clustering
%   Input:
%     W: Adjacency matrix, N-by-N matrix
%     k: number of clusters
%   Output:
%     idx: data point cluster labels, n-by-1 vector.

% YOUR CODE HERE

D = diag(sum(W, 2));
eig_matrix = inv(D) * (D - W);
if issparse(eig_matrix)
    [eigvector, eigvalue] = eigs(eig_matrix);
else
    [eigvector, eigvalue] = eig(eig_matrix);
end

y = eigvector(:, 1:s);
idx = kmeans(y, k);

end
