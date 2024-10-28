img = imread('salt-and-pepper1.tif');
[rows, cols] = size(img);

img_out = zeros(rows, cols);

for i = 2:rows-1
    for j = 2:cols-1
        window = img(i-1:i+1, j-1:j+1);
        sorted_vals = sort(window(:));
        mediana = sorted_vals(5);
        img_out(i, j) = mediana;
    end
end

% Plots

figure;
subplot(1, 2, 1);
imshow(img);
title('Original');

subplot(1, 2, 2);
imshow(uint8(img_out));
title('Mediana');