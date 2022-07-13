%% Ruidos Salt and pepper, Gaussiano y Speckle
% Para Gauss
% Se le agrega o resta valores a partir de una distribucion gaussiana
% media=0;
% sigma=30; %desviacion
% [f c]=size(I);
% Rg=normrnd(media,sigma,[f,c]);
% Irg=uint8(double(I)+Rg);
% Ver el ruido en forma  hist(Rg(:),100)

close all
clear 
clc

RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);

Ir=my_imnoise(I,'salt & pepper',0.1);
Ig=my_imnoise(I,'gaussian',10/128);
Isp=my_imnoise(I,'spleckle',2/128);

figure(1)
subplot(1,2,1)
imshow(Ir)
title('Imagen Salt & pepper')
subplot(1,2,2)
plot(I(1000,:)) %Se grafica una sola fila de la imagen con ruido
hold on
plot(Ir(1000,:),'.r')%Se grafica una sola fila de la imagen con ruido
hold off

figure(2)
subplot(1,2,1)
imshow(Ig)
title('Ruido Gaussiano')
subplot(1,2,2)
plot(I(1000,:)) %Se grafica una sola fila de la imagen con ruido
hold on
plot(Ig(1000,:),'.g')%Se grafica una sola fila de la imagen con ruido
hold off

figure(3)
subplot(1,2,1)
imshow(Isp)
title('Ruido Gaussiano')
subplot(1,2,2)
plot(I(1000,:)) %Se grafica una sola fila de la imagen con ruido
hold on
plot(Isp(1000,:),'.b')%Se grafica una sola fila de la imagen con ruido
hold off

figure(4)
subplot(2,3,1)
imshow(Ir)
title('Imagen Salt & pepper')
subplot(2,3,2)
imshow(Ig)
title('Ruido Gaussiano')
subplot(2,3,3)
imshow(Isp)
title('Ruido Gaussiano')
subplot(2,3,4)
plot(I(1000,:)) %Se grafica una sola fila de la imagen con ruido
hold on
plot(Ir(1000,:),'.r')%Se grafica una sola fila de la imagen con ruido
hold off
subplot(2,3,5)
plot(I(1000,:)) %Se grafica una sola fila de la imagen con ruido
hold on
plot(Ig(1000,:),'.g')%Se grafica una sola fila de la imagen con ruido
hold off
subplot(2,3,6)
plot(I(1000,:)) %Se grafica una sola fila de la imagen con ruido
hold on
plot(Isp(1000,:),'.b')%Se grafica una sola fila de la imagen con ruido
hold off


