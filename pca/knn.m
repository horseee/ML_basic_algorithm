function y = knn(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%

% YOUR CODE HERE

rng('default');
D_matrix = pdist2(X', X_train');
y = zeros(1, size(X, 2));
edge = unique(y_train) - 0.5;
edge = [edge, edge(size(edge, 2))+1];
vote_y = zeros(size(edge, 2), 1);

if K == 1
    [min_value, min_index] = min(D_matrix,[], 2);
    y = y_train(min_index);
else
    [sort_value,sort_index] = sort(D_matrix, 2, 'ascend');
    label_each = y_train(sort_index(:, 1:K));
    for i = 1 : size(X, 2)
        [max_value, max_index] = max(histcounts(label_each(i, :), edge));
        
        y(i) = max_index - 1;
    end
    
    
end


end

