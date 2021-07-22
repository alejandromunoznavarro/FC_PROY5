clc
clear

% EJERCICIO 1

xy = [200 400 600; 375 125 375]';
uv = [ 87 319 600; 445 69 375]';

% Calculo de la matriz afin
P = get_afin(xy,uv)
Q = get_afin(uv,xy)

xy=[xy;300 200]; uv=[uv;200 185]
P2 = get_proy(xy,uv);
Q2 = get_proy(uv,xy);

XY =[xy(:,1) xy(:,2) xy(:,1).^0]';
UV = P2*XY;
w= UV(3,:);
H=(UV./w)';
UV=[H(:,1) H(:,2)]