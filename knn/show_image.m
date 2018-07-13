function show_image(X)
%SHOW_IMAGE Show a CAPTCHA image
%   Inputs:
%       X: 300x5 matrix, 5 digits in an image, each digit is a 140x1 vector.

num = size(X, 2);
X = reshape(X, 30, 21*num);
imagesc(X); colormap(gray); axis image;
end