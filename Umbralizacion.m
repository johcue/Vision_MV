%% Umbralizacion
% Binarizacion:
% Los pixeles que cumplan una condicion se conviertan en 1, 
% y los que no la cumplan se vuelvan 0
% B:I>=T, I:imag en escala de gris o una capa
close all
clear 
clc
I=imread('manzanarojapues.jpg');
figure(1)
imshow(I)

[r g b]=my_imsplit(I);

figure(2)
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


for T=1:255    
bin=my_im2bw(b,T/255);
figure(3)
imshow(uint8(~bin).*I)
title(num2str(T))
pause(0.1)
end
%Tecnica OTSU
%Se construye el instograma de frec
