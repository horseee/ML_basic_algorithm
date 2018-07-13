load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');

% 1. Feature preprocessing
dim  = 128;

% 2. Run PCA
[eigvector, eigvalue] = pca(fea_Train);

% 3. Visualize eigenface
% show_face(eigvector(:, 1024-dim + 1:1024)');

% 4. Project data on to low dimensional space
train_dr = fea_Train * eigvector(:,1024-dim + 1:1024);
test_dr = fea_Test * eigvector(:,1024-dim + 1:1024);

% 5. Run KNN in low dimensional space
test_label = knn(test_dr' ,train_dr', gnd_Train', 1);
wrong_rate = length(find(test_label ~= gnd_Test')) / size(fea_Test, 1)

% 6. Recover face images form low dimensional space, visualize them
train_recover = eigvector(:,1024-dim + 1:1024) * train_dr';
show_face(train_recover');

