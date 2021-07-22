clc
clear

% EJERCICIO 2
im = imread('foto.jpg');
P = [3.6 1.2 -1000; 0.97 4.2 -900; 0.0003 0.0025 1.0];
im2 = aplica_T(im,P);
figure();
imshow(im2);

[RU,RV]=rango_uv(size(im),P);
im2 = aplica_T(im,P,RU,RV);
figure();
imshow(im2);