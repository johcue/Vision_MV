close all
clear
clc

I=imrotate(imread('20140901_020631.jpg'), 270);
[h,s,v]=rgb2hsv(I);

%Definimos Mascara Roja a Mano
%Para H
hmin=0.188; 
hmax=0.420;

Mh=h>=hmin & h<=hmax;

%Para S
smin=0.070; 
smax=1; 

Ms=s>=smin & s<=smax; 

%Para V
vmin=0; 
vmax=1; 

Mv=v>=vmin & v<=vmax; 

M=Mh & Ms & Mv;

%Creamos la images a escala gris
gris=rgb2gray(I);%Hago la imagen a escala de grises
[F C L]=size(I); %Filas, Columnas y Capas
In=uint8(zeros(F,C,L)); %Imagen vacia
In(:,:,1)=gris;%Pongo cada capa a escala de grises
In(:,:,2)=gris;
In(:,:,3)=gris;

If=In.*uint8(~M)+I.*uint8(M);%(~M)Niego la mascara, I.*uint8(M) pongo la mascara a color

figure(1)
subplot(2,2,1)
imshow(I)
title('Imagen Original')

subplot(2,2,2)
imshow(M)
title('Imagen en 1 y 0')

subplot(2,2,3)
imshow(In)
title('Imagen a Escala Grises')

subplot(2,2,4)
imshow(If)
title('Imagen Mascara Roja')