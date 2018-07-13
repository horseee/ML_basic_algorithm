img = imread('sample2.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));

[idx, ctrs, iter_ctrs_single] = kmeans(fea, 64);
fea = ctrs(idx, :);
imshow(uint8(reshape(fea, size(img))));
