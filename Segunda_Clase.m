close all
clear 
clc

%En filtro BW Las tres capaz qudan con la misma submatriz
% C(1:5,1:5,:) son diferentes
% R(1:5,1:5,:), B(1:5,1:5,:),G(1:5,1:5,:) son iguales
%  (filas, columnas, todas las capas)
D = imread('COLOR.jpeg');
R=imread('filtro_R.jpeg');
G=imread('filtro_G.jpeg');
B=imread('filtro_B.jpeg');
% R = D(:,:,1); %Capa roja
% G = D(:,:,2); %Capa Verde
% B = D(:,:,3); %Capa Azul

figure(1)
subplot(2,2,1)
imshow('COLOR.jpeg')
title('Color')

subplot(2,2,2)
imshow(R)
title('Rojo', 'Color','r')

subplot(2,2,3)
imshow(G)
title('Verde', 'Color','g')

subplot(2,2,4)
imshow(B)
title('Azul', 'Color','b')


r=R(:,:,1);%Tomo unicamente la capa roja, pero puedo tomar cualquiera de las tres capas, pues las fotos fueron tomadas todas en blanco y negro con el filtro rojo, las tres capas son identicas
g=G(:,:,1); %(:,:,2) o (:,:,3)
b=B(:,:,1); %(:,:,1) o (:,:,2)

[F C L]=size(D); %Lee la imagen y entrega el valor de las filas, columnas y capas
I=uint8(zeros(F,C,L));% uint8: data type (class)  stored as 1-byte (8-bit) unsigned F=filas; C=columnas,L=capas
I(:,:,1)=r; %+50 se le agrega al rojo
I(:,:,2)=g;
I(:,:,3)=b;

figure (2)
subplot(1,2,1)
imshow(I)

title('Imagen B&W Filtros Superpuestos')
subplot(1,2,2)
imshow(D)
title('Imagen a Color')
