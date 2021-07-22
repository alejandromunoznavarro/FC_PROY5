clc
clear

% EJERCICIO 3
im1 = imread('willis.jpg');
im2 = imread('ant.jpg');

% marcar_puntos;
load puntos

u = x1*0.5+x2*0.5;
v = y1*0.5+y2*0.5;

T=delaunay(u,v);
NT=size(T,1);
subplot(121);
plot(x1,y1,'ro','MarkerSize',5,'MarkerFaceColor','r')
triplot(T,x1,y1)
subplot(122);
plot(x2,y2,'ro','MarkerSize',5,'MarkerFaceColor','r')
triplot(T,x2,y2)

P1 = zeros(3,3,NT);
P2 = zeros(3,3,NT);
for k=1:NT
   indices = T(k,:);
   xx1 = x1(indices);
   yy1 = y1(indices);
   uu1 = u(indices);
   vv1 = v(indices);
   P1(:,:,k)=get_afin([xx1 yy1],[uu1 vv1]);
   
   xx2 = x2(indices);
   yy2 = y2(indices);
   uu2 = u(indices);
   vv2 = v(indices);
   P2(:,:,k)=get_afin([xx2 yy2],[uu2 vv2]);
end
N=size(im1,1);
M=size(im1,2);
zona=determina_triang(T,u,v,N,M);
im11=warp_img(im1,P1,zona);
im22=warp_img(im2,P2,zona);
figure();
imshow(im11);
figure();
imshow(im22);

% Promediamos
immedia=0.5*im11+0.5*im22;
figure();
imshow(immedia);
