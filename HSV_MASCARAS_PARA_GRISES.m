%% Dejar una sola parte con color y el resto en escala de grises
close all
clear
clc

I=imread('DSCN8200.jpg');
[h,s,v]=rgb2hsv(I);

%Definimos Mascara a Mano
%Para H
hmin=0.913; 
hmax=0.049;

Mh= h<=hmax;%El rojo esta en negativos

%Para S
smin=0.279; 
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
title('Imagen Mascara Verde')