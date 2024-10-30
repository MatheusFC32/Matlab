clc, clear all;

%Transformations

	% Piecewise Linear
	y_pwln          = uint8(zeros([1 256]));
	y_pwln(1:97)    = (1/3)*(0:96);
	y_pwln(98:161)  = 3*(97:160) - 256;
	y_pwln(162:256) = (1/3)*(161:255) + 170;
	
	% Piecewise Linear2
	y_pwl2          = uint8(zeros([1 256]));
	y_pwl2(1:128)   = (0:127);
	y_pwl2(129:161) = 3*(128:160) - 256;
	y_pwl2(162:256) = (1/3)*(161:255) + 170;

% LUTs Plots

	figure, plot(y_pwln), title('Piecewise linear'  ), xlim([0 255]), ylim([0 255]), grid on, xlabel('x'), ylabel('y');
	figure, plot(y_pwl2), title('Piecewise linear 2'), xlim([0 255]), ylim([0 255]), grid on, xlabel('x'), ylabel('y');

% Images

	img_orgn = imread('vpfig.png');
	img_pwln = intlut(img_orgn,y_pwln);
	img_pwl2 = intlut(img_orgn,y_pwl2);

% Image Plots

	figure, imshow(img_orgn), xlim([0 255]), ylim([0 255]), title('Original'          );
	figure, imshow(img_pwln), xlim([0 255]), ylim([0 255]), title('Piecewise Linear'  );
	figure, imshow(img_pwl2), xlim([0 255]), ylim([0 255]), title('Piecewise Linear 2');