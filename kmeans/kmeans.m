function [idx, ctrs, iter_ctrs] = kmeans(X, K)
%KMEANS K-Means clustering algorithm
%
%   Input: X - data point features, n-by-p maxtirx.
%          K - the number of clusters
%
%   OUTPUT: idx  - cluster label
%           ctrs - cluster centers, K-by-p matrix.
%           iter_ctrs - cluster centers of each iteration, K-by-p-by-iter
%                       3D matrix.

% YOUR CODE HERE

iter = 0;
%min_distance = 0
min_distance = 1000000000000;
min_ctrs = [];
min_idx = [];

while iter < 1000

    iter = iter + 1;
    idx = zeros(size(X, 1), 1);
    center_init = ceil(rand(1, K) .* size(X, 1));
    ctrs = X(center_init, :);

    iter_ctrs = ctrs;
    
    %sum_of_distance = 0; %max
    sum_of_distance = 1000000000000; %min

    while true    
       dis = pdist2(X, ctrs);
       [~, idx] = min(dis, [], 2);
       distance_temp = 0;
       ctrs = [];
       for i = 1:K
           K_data = X(find(idx == i), :);
           ctr = sum(K_data, 1) ./ length(K_data);
           ctrs = [ctrs; ctr;];
           distance_temp = distance_temp + sum(sum(pdist2(K_data, ctr), 1));
       end
       iter_ctrs = cat(3, iter_ctrs, ctrs);

       %max
       %if distance_temp > sum_of_distance
       %min
       if distance_temp < sum_of_distance
           sum_of_distance = distance_temp;
       else
           break
       end
    end
    
    fprintf("iter :%d, distance : %f\n", iter, sum_of_distance);
    if sum_of_distance < min_distance
        min_ctrs = ctrs;
        min_idx = idx;
        min_iter_ctrs = iter_ctrs;
        fprintf("Refresh distance! origin : %f\n", min_distance);
        min_distance = sum_of_distance;
        
    end
end

idx = min_idx;
ctrs = min_ctrs;
iter_ctrs = min_iter_ctrs;

end
   