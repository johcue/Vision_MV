%% HISTOGRAMA
% La SUM de los h del histograma es igual al tamaño de la imagen, matriz
clear 
close all
clc
I= imread('Filtros.jpg');

r=I(:,:,1);
g=I(:,:,2);
b=I(:,:,3);

figure(2)

subplot(3,3,1)
imshow(r)
title('Rojo', 'Color','r')
subplot(3,3,4)
my_imhist(r)
subplot(3,3,7)
imhist(r)


subplot(3,3,2)
imshow(g)
title('Verde', 'Color','g')
subplot(3,3,5)
my_imhist(g)
subplot(3,3,8)
imhist(g)


subplot(3,3,3)
imshow(b)
title('Azul', 'Color','b')
subplot(3,3,6)
my_imhist(b)
subplot(3,3,9)
imhist(b)


R=I;
R(:,:,2)=0;%Capa verde igual a cero, pero igual existe 
R(:,:,3)=0;%Capa azul igual a cero 

G=I;
G(:,:,1)=0;%Capa verde igual a cero 
G(:,:,3)=0;%Capa azul igual a cero 

B=I;
B(:,:,1)=0;%Capa verde igual a cero 
B(:,:,2)=0;%Capa azul igual a cero 


figure(3)

subplot(3,3,1)
imshow(R)
title('Rojo', 'Color','r')
subplot(3,3,4)
my_imhist(R)
subplot(3,3,7)
imhist(R)

subplot(3,3,2)
imshow(G)
title('Verde', 'Color','g')
subplot(3,3,5)
my_imhist(G)
subplot(3,3,8)
imhist(G)

subplot(3,3,3)
imshow(B)
title('Azul', 'Color','b')
subplot(2,3,6)
my_imhist(B)
subplot(3,3,9)
imhist(B)

