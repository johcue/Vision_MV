% Imagenes
% Las imagenes se pueden representar tambien por vectores.
% Elementos de imagen: Un pixel es una posicion y en el tiene informacion de intensidad p=(row,col), I(p)= [red green blue]
% I(r,c,1)+I(r,c,2)+I(r,c,3)=I
% B' transponer matriz
% A.*B y A./B multiplicacion y division elemento por elemento diferente a la mult y div(inv) de matrices
% ; cambia de fila
%sacar toda una fila C(1, :)
%Sacar toda una columna C(:,1)
% Sacar especificos C(2:3, 2:3)
%                     Fila: columna, 
clear all
close all
clc
I1= imread('cartagena.jpg');
% I2= imread('sis.jpg');
% figure(1)
% imshow(I1)
% figure(2)
% imshow(I2)
% 
% figure(3)
% subplot(1,2,1)
% imshow(I1)
% subplot(1,2,2)
% imshow(I2)

r=I1(:,:,1); %Capa roja
g=I1(:,:,2); %Capa Verde
b=I1(:,:,3); %Capa Azul

figure(4)
subplot(2,2,1)
imshow(I1)
title('Color')
subplot(2,2,2)
imshow(r)
title('Rojo', 'Color','r') %En la escala BW, la mayor intensidad se ve blanca. Por eso aca el rojo se ve blanco y el azul, en este caso, negro. 
subplot(2,2,3)
imshow(g)
title('Verde', 'Color','g')
subplot(2,2,4)
imshow(b)
title('Azul', 'Color','b')

R=I1;
R(:,:,2)=0;%Capa verde igual a cero, pero igual existe 
R(:,:,3)=0;%Capa azul igual a cero 

V=I1;
V(:,:,1)=0;%Capa verde igual a cero 
V(:,:,3)=0;%Capa azul igual a cero 

A=I1;
A(:,:,1)=0;%Capa verde igual a cero 
A(:,:,2)=0;%Capa azul igual a cero 


figure(5)
subplot(2,2,1)
imshow(I1)
title('Normal')
subplot(2,2,2)
imshow(R)
title('Rojo', 'Color','r')
subplot(2,2,3)
imshow(V)
title('Verde', 'Color','g')
subplot(2,2,4)
imshow(A)
title('Azul', 'Color','b')

C=255-R; %Cyan
M=255-V; %Magenta
Y=255-A; %Amarillo

figure(6)
subplot(2,2,1)
imshow(I1)
title('Normal')
subplot(2,2,2)
imshow(C)
title('CYAN', 'Color','c')
subplot(2,2,3)
imshow(M)
title('MAGENTA', 'Color','m')
subplot(2,2,4)
imshow(Y)
title('AMARILLO', 'Color','y')
