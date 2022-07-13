close all
clear 
clc

RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);
paso=8;%Para reducir el tamaño de la imagen
I=I(1:paso:end, 1:paso:end);

J=entropyfilt(I,ones(3));
J=uint8(J);
figure(1)
imshow(J)
k=ones(3);
T1=my_entropyfilt(I,k);
figure(2)
imshow(T1)