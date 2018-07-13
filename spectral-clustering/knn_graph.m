function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.
%
%   Output:W - adjacency matrix, n-by-n matrix.

% YOUR CODE HERE

n = size(X, 1);
W = zeros(n, n);
theta = 0.2;

dist_matrix = pdist2(X, X);
[B,I] = sort(dist_matrix, 2, 'ascend');
near_index_matrix = I(:, 2:1+k);

for i=1:n
    for j = 1:k
        ind = near_index_matrix(i, j);
        if find(near_index_matrix(ind, :) > 0)
            W(i, ind) = exp(-dist_matrix(i, ind) / 2 / (theta ^ 2));
        end
        if W(i, ind) < threshold
            W(i, ind) = 0;
        end 
    end
end

end
