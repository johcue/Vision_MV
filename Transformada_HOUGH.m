%% TRANSFORMADA DE HOUGH
% El y crece hacia abajo en una imagen (2D)
% Se hace una transformacion de x,y a m,b (pendiente, intercepto)
% Se recurre a la forma Hessiana de la recta, en lugar de -infinito a
% +infinito, se utilizaran rho (dist mas corta desde el origen hasta la
% recta y=mx+b, y el angulo del rho (-Pi/2 a Pi/2)
% cos(theta)=rho/a --> a=rho/cos(theta)
% sin theta=rho/b --> b=rho/sin(theta)
% De forma que xcos(theta)+ysin(theta)=rho
% Y, asi, m=-b/a=cot(theta)

% Genera curvas, tantas como cuantas tenga la linea. Por cada pixel en
% blanco generara una curva

clear  
close all
clc


I=imread('linea.jpg');
bin=~imbinarize(rgb2gray(imread('linea.jpg')));%La vuelvo binaria invertida ~

figure(1)
imshow(bin)
title('La IMAG Binarizada')

[TH, Tmap, Rmap]=my_hough(bin);

figure(2)
imshow(TH/max(TH(:)),'xdata',Tmap,'ydata',Rmap,'initialmagnification','fit')
title('TRANSFORMADA DE HOUGH')
xlabel('\theta'), ylabel('\rho')
axis on, axis normal, hold on;
colormap(gca,hot);%graphi color arraw

%Mapeo
[Rm Tm]=find(TH==max(TH(:)));%Poscion del valor maximo, un pico
RL=Rmap(Rm); %Rho verdadedor
TL=Tmap(Tm); %Theta verdadedor

m=-cotd(TL);
b=RL/sind(TL);

x=[1:200]; %Porque la IMAG es de 200x200
y=m*x+b;

figure(3)
imshow(I)
hold on
plot(x,y,'g--')
title('La fucion y=m*x+b')
hold off


