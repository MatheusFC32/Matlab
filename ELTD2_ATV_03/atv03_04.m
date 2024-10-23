clc, clear all;

% Imagem

    img_orgn = imread('gDSC04422m16.png');

% Equalizar o histograma

	img_eqlz = histeq(img_orgn, 256);

% Plot
	
	figure;
	subplot(1, 2, 1),imshow(img_orgn),title('Imagem Original');
	subplot(1, 2, 2),imshow(img_eqlz),title('Imagem Equalizada');