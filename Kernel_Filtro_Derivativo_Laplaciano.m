%% Kernel Filtro Derivativo Laplaciano
%Bordes
%laplacian
close all
clear 
clc
RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);
%Laplacian 4 Puntos
% K=[ 0 1 0;
%    1 -4 1;
%    0 1 0];
% K=my_fspecial('laplacian',0);
%Laplacian 8 Puntos
   K=[ 0  1  0;
       1 -8  1;
       0  1  0];
Ikl=my_imfilter(I,K);
figure(1)
imshow(Ikl)