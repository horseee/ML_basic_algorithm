function img = hack_pca(filename)
% Input: filename -- input image file name/path
% Output: img -- image without rotation

img_r = double(imread(filename));

[row, column] = find(img_r' < 255);
new_data = [row, column];
[eigvector, eigvalue] = pca(new_data);
angle = rad2deg(atan(eigvector(2, 2)/eigvector(2, 1)));

rotate_img = imrotate(imread(filename),angle);
imshow(rotate_img);

end