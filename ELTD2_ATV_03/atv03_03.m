clc, clear, close all;

% Imagem

    img_orgn = imread('42049_20-200.png');

% Calcular o histograma manualmente
    
    n_pixels = numel(img_orgn);
    hist_manual = zeros(256, 1);

    for i = 1:n_pixels
        idx = img_orgn(i) + 1;
        hist_manual(idx) = hist_manual(idx) + 1;
    end

% Plot

    figure, imshow(img_orgn), xlim([0 255]), ylim([0 255]), title('Sigmoid');
    figure, bar(0:255, hist_manual), title('Hist. Manual'), xlim([-1 255]), grid on, xlabel('x'), ylabel('y');
    figure, imhist(img_orgn), title('Hist. Lib.'), xlim([-1 255]), grid on, xlabel('x'), ylabel('y');
