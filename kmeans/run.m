%% kmean_data
load('kmeans_data.mat')
[idx, ctrs, iter_ctrs] = kmeans(X, 2);
kmeans_plot(X, idx, ctrs, iter_ctrs);

%% digit_data
load('digit_data.mat')
[idx, ctrs, iter_ctrs] = kmeans(X, 50);
show_digit(ctrs);