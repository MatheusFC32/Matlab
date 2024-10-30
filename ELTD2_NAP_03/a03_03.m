% a03_03 [script]
clc, clear, close all

g = imread('radio.tif');
figure, imshow(g), title('g')
mg = min(g(:))
Mg = max(g(:))

% Experimentando auto-contraste
gac = mat2gray(g);
figure, imshow(g), title('gac')
mgac = min(gac(:))
Mgac = max(gac(:))

%Funcao log
%Logaritmo neperiano (base e)
gd = double(g); %para a saída ser double
g1 = log(gd+1);
figure, imshow(g1), title('g1')
mg1 = min(g1(:))
Mg1 = max(g1(:))

% Arrumando a escala
c = 1/log(255);
g2 = c*log(gd+1);
figure, imshow(g2), title('g2')
mg2 = min(g2(:))
Mg2 = max(g2(:))

% Arrumando a escala
g3 = log(g2+1);
figure, imshow(g3), title('g3')
mg2 = min(g3(:))
Mg2 = max(g3(:))