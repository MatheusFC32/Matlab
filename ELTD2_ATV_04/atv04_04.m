input_image = imread('flowervaseg.png');

mask_OM = [0, -1, 0; -1, 5, -1; 0, -1, 0];
mask_LG = [-1, -1, -1; -1, 9, -1; -1, -1, -1];

output_image_OM = imfilter(input_image, mask_OM, 'conv', 'same');
output_image_LG = imfilter(input_image, mask_LG, 'conv', 'same');

figure;

subplot(1, 3, 1);
imshow(input_image);
title('Input Image');

subplot(1, 3, 2);
imshow(output_image_OM);
title('Composite Laplacian [OM]');

subplot(1, 3, 3);
imshow(output_image_LG);
title('Composite Laplacian [LG]');
