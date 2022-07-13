%% TRANSFORMADA DE HOUGH PARA CIRCULOS
% Entrega centro de la circunferencia y radio
% El radio se supone que es conocido porque es el mismo en cada valor x,y
% Sin embargo, no conocemos ese radio, pero lo que se hace es una Trans de
% Hogh para cada valor del radio
% Dependiendo del corte más brillante, ese seria el punto de corte de valor
% del Radio
% [centers, radii] = imfindcircles(G, [10 50]); %Trans Hogh para Cicrulos de matlab
% viscircles(centers(1,:), radii(1,:),'EdgeColor','y');
% viscircles(centers(2,:), radii(2,:),'EdgeColor','b');
% viscircles(centers(3,:), radii(3,:),'EdgeColor','r');
% [centers, radii] = imfindcircles(bin, [10 40], 'sensitivity',0.83); % Trans Hogh para Cicrulos de matlab
                                                                    % [10 50] rango de las circunferencias
                                                                    % sensitivity que tal completas estan
clc 
close all
clear

C=imread('ojo2.jpg');
G=rgb2gray(C);
% Kg=fspecial('gaussian',29,4);
% Ifg=imfilter(G,Kg);%Filtro Laplaciano
% 
% Kl=fspecial('laplacian',0);
% Ifl=imfilter(Ifg,Kl);%Filtro Laplaciano
% 
% T=0.2;
% bin=double(im2bw(double(Ifl)/double(max(Ifl(:))),T));

%En lugar de utilizar lo de arriba utilizamos la funcion edge canny
bin=edge(G,'canny',0.5,6);

figure(1)
subplot(2,2,1)
imshow(C)
title('OJOS Normal')

subplot(2,2,2)
imshow(G)
title('OJOS a Escala de Grises')

subplot(2,2,3)
imshow(bin,[])
title('Imagen Filtrada Binarizada')


subplot(2,2,4)
imshow(C,[])
[centers, radii] = imfindcircles(bin, [10 40], 'sensitivity',0.83); 
[centers2, radii2] = imfindcircles(bin, [90 400], 'sensitivity',0.96);
hold on
viscircles(centers, radii,'EdgeColor','y');
viscircles(centers2, radii2,'EdgeColor','r');
hold off
title('AAAAAAAAAHHHHHHHHHHHHHHHHHHHH')



[X Y]=meshgrid(1:700,1:411);%Una grilla
%Para el rojo v':
xc2=centers2(1);
yc1=centers2(2);
xc=centers(1);
yc=centers(2);
Ec=~((X-xc2).^2+(Y-yc1).^2>=radii2^2) & ((X-xc).^2+(Y-yc).^2>=radii^2);%~para que nos quede la pepita blanca
Ec1=uint8(Ec).*C;

figure(2)
imshow(Ec1)%Y aca multiplicamos por el color


% r=Ec1(:,:,1); %Capa roja
% g=Ec1(:,:,2); %Capa Verde
% b=Ec1(:,:,3); %Capa Azul
% 
% figure(3)
% subplot(2,2,1)
% imshow(Ec1)
% title('Color')
% subplot(2,2,2)
% imshow(r)
% title('Rojo', 'Color','r') %En la escala BW, la mayor intensidad se ve blanca. Por eso aca el rojo se ve blanco y el azul, en este caso, negro. 
% subplot(2,2,3)
% imshow(g)
% title('Verde', 'Color','g')
% subplot(2,2,4)
% imshow(b)
% title('Azul', 'Color','b')


















