clc, clear all;

% Imagem

    img_orgn = imread('gDSC04422m16.png');

% Equalização manual

    [M, N] = size(img_orgn);
    hist = zeros(256, 1);
    for i = 1:M
        for j = 1:N
            idx = img_orgn(i, j) + 1;
            hist(idx) = hist(idx) + 1;
        end
    end

    norm_hist = double(hist) / double(M * N);
    cdf = cumsum(norm_hist);
    LUT = uint8(cdf * 255);
    img_eqlz_manual = intlut(img_orgn,LUT);

% Equalização histeq
    
    img_eqlz_histeq = histeq(img_orgn, 256);

% Plot
    
    figure,imshow(img_orgn),title('Imagem Original');
    figure,imshow(img_eqlz_manual),title('Imagem Equalizada (Manual)');
    figure,imshow(img_eqlz_histeq),title('Imagem Equalizada (histeq)');
    figure,imhist(img_orgn),title('Hist Original');
    figure,imhist(img_eqlz_manual),title('Hist Equalizado (Manual)');
    figure,imhist(img_eqlz_histeq),title('Hist Equalizado (histeq)');
