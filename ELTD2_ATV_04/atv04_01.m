% Box

box = ones(3, 3) / 9;

% Gaussiano

sigma = 1;
window_size = 5;

gaussiano = zeros(window_size, window_size);
range = -(window_size-1)/2 : (window_size-1)/2;
for i = 1:window_size
    for j = 1:window_size
        x = range(i);
        y = range(j);
        gaussiano(i, j) = (1 / (2 * pi * sigma^2)) * exp(-(x^2 + y^2) / (2 * sigma^2));
    end
end

% Normalizar a matriz
gaussiano = gaussiano / sum(gaussiano(:));

% Plots

figure;
bar3(box);
title('Box 3x3');
xlabel('X');
ylabel('Y');
zlabel('Amplitude');

figure;
bar3(gaussiano);
title('Gaussiano 5x5, \sigma=1');
xlabel('X');
ylabel('Y');
zlabel('Amplitude');
