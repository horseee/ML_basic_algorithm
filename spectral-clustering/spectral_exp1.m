load('cluster_data', 'X');

% Choose proper parameters
k_in_knn_graph = 50;
threshold = 0.01;

W = knn_graph(X, k_in_knn_graph, threshold);
idx = spectral(W, 2, 1);
cluster_plot(X, idx);

figure;
idx = kmeans(X, 2);
cluster_plot(X, idx);
