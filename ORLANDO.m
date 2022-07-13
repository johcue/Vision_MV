% clear 
% close all
% clc
% I = imread('Orlando.jpg');
% r = I(:,:,1); %Capa roja
% g = I(:,:,2); %Capa Verde
% b = I(:,:,3); %Capa Azul
% 
% figure(1)
% subplot(2,2,1)
% imshow(I)
% title('Imagen Original')
% subplot(2,2,2)
% imshow(r)
% title('Capa Roja', 'Color','r')
% subplot(2,2,3)
% imshow(g)
% title('Capa Verde', 'Color','g')
% subplot(2,2,4)
% imshow(b)
% title('Capa Azul', 'Color','b')
% 
% figure(2)
% subplot(2,1,1)
% imshow(I)
% title('Imagen Original')
% subplot(2,1,2)
% [I1] = gray2rgb(r);
% imshow(I1)
% title('Imagen a Color')



%% ESCALA DE GRISES
% Promedio: Sumar las capas y dividirlas por 3
% Midgray: Pixeles mas altos y se dividen por 2
% Limunancia: Promedio porcentual R*0.299 G*0587 B*0.114
% Algunos colores se van a perder en escala de grises

%vamos a cambiar la imagen a color a escala de grises

clear 
close all
clc

I = imread('Orlando.jpg');

[r g b]=my_imsplit(I); %sacamos las capas R G B

figure(1)
subplot(1,3,1)
imshow(r)
title('Capa Rojo', 'Color','r')

subplot(1,3,2)
imshow(g)
title('Capa Verde', 'Color','g')

subplot(1,3,3)
imshow(b)
title('Capa Azul', 'Color','b')

% gray=uint8(0.299*double(r)+0.587*double(g)+0.114*double(b));%Creamos la imagen a escala de grises
gray=my_rgb2gray(I);

figure(2)
subplot(1,2,1)
imshow(I)
title('A color')

subplot(1,2,2)
imshow(gray)
title('Escala de Grises')