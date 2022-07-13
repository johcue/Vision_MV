%% Metodo OTSU de BINARIZACION
close all
clear 
clc
I=imread('guayabat5.jpg');

[r g b]=my_imsplit(I);

figure(1)
subplot(2,3,1)
imshow(r)
subplot(2,3,2)
imshow(g)
subplot(2,3,3)
imshow(b)
subplot(2,3,4)
my_imhist(r)
subplot(2,3,5)
my_imhist(g)
subplot(2,3,6)
my_imhist(b)

T=my_graythresh(b);%Metodo OTSU
bin=my_im2bw(b,T);%Umbral

figure(2)
subplot(1,2,1)
imshow(I)
title('Imagen a Color')
subplot(1,2,2)
imshow(bin)
title('Imagen Binarizada')