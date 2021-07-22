clc
clear
t=0:0.025:1;
for k = 1:length(t)
% EJERCICIO 3
im1 = imread('willis.jpg');
im2 = imread('ant.jpg');

% marcar_puntos;
load puntos

u=(1-t(k))*x1+t(k)*x2;
v=(1-t(k))*y1+t(k)*y2;

T=delaunay(u,v);
NT=size(T,1);
% subplot(121);
% plot(x1,y1,'ro','MarkerSize',5,'MarkerFaceColor','r')
% triplot(T,x1,y1)
% subplot(122);
% plot(x2,y2,'ro','MarkerSize',5,'MarkerFaceColor','r')
% triplot(T,x2,y2)

P1 = zeros(3,3,NT);
P2 = zeros(3,3,NT);
    for j=1:NT
       indices = T(j,:);
       xx1 = x1(indices);
       yy1 = y1(indices);
       uu1 = u(indices);
       vv1 = v(indices);
       P1(:,:,j)=get_afin([xx1 yy1],[uu1 vv1]);

       xx2 = x2(indices);
       yy2 = y2(indices);
       uu2 = u(indices);
       vv2 = v(indices);
       P2(:,:,j)=get_afin([xx2 yy2],[uu2 vv2]);
    end
N=size(im1,1);
M=size(im1,2);
zona=determina_triang(T,u,v,N,M);
im1_d=warp_img(im1,P1,zona);
im2_d=warp_img(im2,P2,zona);
% figure();
% imshow(im1_d);
% figure();
% imshow(im2_d);

% Promediamos
res = (1-t(k))*im1_d + t(k)*im2_d;
% figure();
% imshow(res);
fich=sprintf('res%02d.jpg',k); imwrite(res,fich,'Quality',95);
end
