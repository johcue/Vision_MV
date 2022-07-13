%% Ruidos Salt and pepper, Gaussiano y Speckle
close all
clear 
clc

RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);

Ir=my_imnoise(I,'salt & pepper',0.1);
Ig=my_imnoise(I,'gaussian',10/128);
Isp=my_imnoise(I,'speckle',30/128);

figure(1)
subplot(2,1,1)
imshow(Ir)
title('Ruido Salt & pepper')
subplot(2,1,2)
plot(I(1000,:)) 
hold on
plot(Ir(1000,:),'.r')
hold off

figure(2)
subplot(2,1,1)
imshow(Ig)
title('Ruido Gaussiano')
subplot(2,1,2)
plot(I(1000,:)) 
hold on
plot(Ig(1000,:),'.g')
hold off

figure(3)
subplot(2,1,1)
imshow(Isp)
title('Ruido Speckle')
subplot(2,1,2)
plot(I(1000,:)) 
hold on
plot(Isp(1000,:),'.y')
hold off


