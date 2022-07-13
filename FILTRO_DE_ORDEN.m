%% FILTRO DE ORDEN
% Oragiza los elementos del menor al mayor 
% Me quedo con el Elemento que yo quiera de un conjunto de números de la imagen
% my_orfit2
close all
clear 
clc
RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);

Isp=imnoise(I, 'salt & pepper', 0.01);

K=ones(3);
% IMin=my_orfit2(Isp,1,K);
% IMax=my_orfit2(Isp,9,K);
% IMedia=my_orfit2(Isp,5,K);
% IMedia2=my_medfit2(I, [3 3]);
%Si la K es de 3x3, Cuando es 1, es filtro min, cuando es 9 es filtro max
%cuando es 5, es de la median
Istd=my_stdfilter(Isp,K);%filtro por desviacion estandar
%
figure(1)
imshow(Istd)

% figure(2)
% imshow(IMin)
% 
% figure(3)
% imshow(IMax)
% 
% imshow(IMedia2)
% 
% figure(5)
% imshow(IMedia)