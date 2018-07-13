function X = extract_image(image_file_name)
%EXTRACT_IMAGE Extract features from image
%   Inputs:
%       image_file_name: filename of image
%   Outputs:
%       X: 630x5 matrix, 5 digits in an image, each digit is a 140x1 vector.

m = imread(image_file_name);
d1 = reshape(m(10:39, 8:28), 630, 1);
d2 = reshape(m(10:39, 28:48), 630, 1);
d3 = reshape(m(10:39, 48:68), 630, 1);
d4 = reshape(m(10:39, 68:88), 630, 1);
d5 = reshape(m(10:39, 88:108), 630, 1);
X = [d1, d2, d3, d4, d5];

end
