img = imread('b5s.40.bmp');

sigma1 = 1;
sigma2 = 3;

gaussian_1 = fspecial('gaussian', [5 5], sigma1);
img_1 = imfilter(img, gaussian_1, 'replicate');

gaussian_2 = fspecial('gaussian', [5 5], sigma2);
img_2 = imfilter(img, gaussian_2, 'replicate');

figure;
subplot(1, 3, 1);
imshow(img);
title('Imagem Original');

subplot(1, 3, 2);
imshow(img_1);
title(['Gaussiano \sigma = ', num2str(sigma1), ')']);

subplot(1, 3, 3);
imshow(img_2);
title(['Gaussiano \sigma = ', num2str(sigma2), ')']);
