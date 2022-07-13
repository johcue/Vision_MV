%% LoG Kernal Unitario
%Tomar la func gaussinana sacarle la segunda derivda con respecto a x, sacarle la segunda derivda con respecto a y, y sumarlas 
%La suma de todos los valores debe ser igualacero, se debe normalizar el
%valor
close all
clear 
clc
RGB=imread('marco.jpg');
I=rgb2gray(RGB);


K=my_fspecial('gaussian',17,17/6);
Ig=my_imfilter(I,K);

figure(1)
imshow(I)

figure(2)
imshow(Ig)

Kl=my_fspecial('laplacian',0);
Il=my_imfilter(Ig,Kl);
figure(3)
imshow(Il, [])

% Aplicandola funcion

KlogK=my_fspecial('log',17,17/6);
IlogK=my_imfilter(I,KlogK);
figure(4)
imshow(IlogK, [])

figure(5)
subplot(1,2,1)
surf(K)
subplot(1,2,2)
surf(KlogK)

In=I-IlogK;
figure(6)
imshow(In)


KPrewitt=my_fspecial('prewitt');
KPrewitt=KPrewitt.';
IPrewitt=my_imfilter(I,KPrewitt);

figure(7)
imshow(IPrewitt)


KSobel=my_fspecial('sobel');
IKSobel=my_imfilter(I,KSobel);

figure(8)
imshow(IKSobel)

%% La Funcion
% Kernel Estandar
% clear all
% clc
% L=3;
% S=0.5;
% Limite=(L-1)/2;
% [X Y]=meshgrid(-Limite:Limite,-Limite:Limite);
% % K=(-2/(pi()*S^4))*exp(-(X.^2+Y.^2)/(2*S^2))*(1-((X.^2+Y.^2)/(2*S^2)))%Kernel
% G=((1/(2*pi()*S^2))*exp(-(X.^2+Y.^2)/(2*S^2)));
% ks=sum(G(:));
% Termin_z=X.^2+Y.^2*S^2;
% e=exp(-(X.^2+Y.^2)/(2*S^2));
% f=1/(2*pi()*S^6*ks);
% Z=f*(Termin_z).*e;
% K=Z-sum(Z(:))/L^2



















