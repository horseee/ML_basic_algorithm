
%% knn experiment
[X, y] = mkdata;

K = [1, 10, 100];
for i = 1:length(K)
    knn_plot(X, y, K(i));
end

%% CAPTCHA experiment
% make dataset

X0 = extract_image('image/00211.png');
X1 = extract_image('image/12615.png');
X2 = extract_image('image/24806.png');
X3 = extract_image('image/32185.png');
X4 = extract_image('image/43603.png');
X5 = extract_image('image/57447.png');
X6 = extract_image('image/61430.png');
X7 = extract_image('image/78122.png');
X8 = extract_image('image/81527.png');
X = [X0,X1,X2,X3,X4,X5,X6,X7,X8];
y = [0 0 2 1 1 1 2 6 1 5 2 4 8 0 6 3 2 1 8 5 4 3 6 0 3 5 7 4 4 7 6 1 4 3 0 7 8 1 2 2 8 1 5 2 7];
show_image(X);

save('hack_data.mat','X', 'y');

%% DO TEST on NEW CAPTCHA
load('hack_data')
test = extract_image('test2.png');
result = knn(test, X, y, 5)