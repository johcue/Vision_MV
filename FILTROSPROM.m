%% FILTRADO ESPACIAL
close all
clear 
clc
RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);
paso=4;%Para reducir el tamaño de la imagen
I=I(1:paso:end, 1:paso:end);

%Kernel Definido
L=31;

K=my_fspecial('average',L);%fspecial de matlab para crear eñ kernel
T1=my_imfilter(I,K);
T3=my_modefilt(I,K);

K1=my_fspecial('gaussian',L,L/6);%MODELO OPTICO IMAGEN DESENFOCADA POR PLANO DE OPTICA
T2=my_imfilter(I,K1);
T4=my_modefilt(I,K1);

figure(1)
imshow(I)
title('Imagen Original')

figure(2)
imshow(T3)
title('FILTRO Metodo Promedio')

figure(3)
imshow(T4)
title('FILTRO Metodo GAUSSIAN')
%MSEimmse(iref, in)Error medio cuadratico, imag e imag con ruido double se
%restan .^2


