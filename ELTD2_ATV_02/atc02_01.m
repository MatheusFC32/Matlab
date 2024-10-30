%    Fecha todas as janelas, limpa o workspace e limpa o console.
close all; clear all; clc; %#ok<*CLALL>

%    Lê a imagem 'cameraman.tif' e armazena na variável G.
G = imread('cameraman.tif');

%    Obtém o size da imagem.
nr = size(G,1); % Obtém o número de linhas da imagem.
nc = size(G,2); % Obtém o número de colunas da imagem.

%{
     Cria duas matrizes X e Y de size nr.nc onde;
     X é uma matriz com nc linhas com cada uma sendo a sequência de 1:nr
     Y é uma matriz com nr colunas com cada uma sendo a sequência de 1:nc
%}
[X,Y] = meshgrid(1:nr,1:nc); 

%    Calcula o número total de pixels na imagem.
N = nr*nc; 

%{
     Monta a lista de vetores coordenada I com todas as combinações de coordenadas (X, Y) 
     em vetores coluna e adiciona um 1 ao final de cada vetor para usar coordenada homogênea.
%}
I = [X(:)';
     Y(:)';
     ones(1,N)];

%    Define uma matriz de transformação de rotação de 30 graus (em radianos).
ang = 30*pi/180; 
T = [ cos(ang) sin(ang) 0;
     -sin(ang) cos(ang) 0;
      0         0        1];

%{
     Aplica a matriz de transformação de rotação T acima aos vetores
     coordenada da lita I pra gerar a lista de coordenadas K.
     Mapeando coordenada I -> coordenada K.
%}
K = T*I; 

%{
     Identifica a "origem" das coordenadas e translada  
     os vetores para que ela seja (0,0)
%}
temp1 = min(K, [], 2);   % Encontra os mínimos de cada linha (x e y) da lista K.
m = repmat(temp1, 1, N); % Cria uma matriz onde esses mínimos são replicados para cada coluna.
temp2 = K - m;           % Subtrai os mínimos das coordenadas, ajustando para a nova origem.

%    Converte as coordenadas floating-point para inteiros e começa em (1,1).
Kadj = 1 + floor(temp2);

%    Determina o tamanho da nova imagem após a rotação.
nrOut = max(Kadj(1,:)); % A nova altura será o máximo dos novos valores de x.
ncOut = max(Kadj(2,:)); % A nova largura será o máximo dos novos valores de y.

%    Cria uma nova imagem vazia com o tamanho calculado.
Gout = uint8(zeros(nrOut, ncOut)); 

%{
     Preenche a nova imagem com os valores da imagem original baseando-se nas novas coordenadas.
     A cor do pixel na coordenada I em G é posto na sua correspondente coordenada K na nova imagem Gout.
%}
for k = 1:length(Kadj)
    Gout(Kadj(1,k), Kadj(2,k)) = G(I(1,k), I(2,k));
end

% Exibe a imagem resultante da transformação.
imshow(Gout); 

%{
     O problema com a abordagem utilizada é que, por causa da conversão de floating-point para int na
     linha 51, múltiplas coordenadas I  são mapeadas para a mesma coordenada K.
     Isso não só faz com que subsequentes coordenadas I mapeadas para uma coordenada K sobrescreva
     a cor já posta lá, mas faz com que algumas coordenadas K não possuam uma única coordenada I
     que seja mapeada para ela, mantendo a cor nessas coordenadas o 0/preto com que foram criadas.      
%}

