clc, clear all;

%Transformation

	% Sigmoid
	y_sigm = 1./(1 + exp(-0.05*((0:255) - 127)));
	y_sigm = mat2gray(y_sigm);
	y_sigm = uint8(y_sigm.*255);

% Image

	img_orgn = imread('vpfig.png');
	img_sigm = intlut(img_orgn,y_sigm);

% LUTs Plot

	figure, plot(y_sigm), title('Sigmoid'), xlim([0 255]), ylim([0 255]), grid on, xlabel('x'), ylabel('y');

% Image Plots

	figure, imshow(img_sigm), xlim([0 255]), ylim([0 255]), title('Sigmoid');