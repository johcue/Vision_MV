%% COLOR
% CIE RGB, son los que ponen patrones de colores
% Hacer una GUIDE para esto c': 
%
clear all
close all
clc

I=imread('cartagena.jpg');
[r g b]=my_imsplit(I); %sacamos las capas R G B

%Umbralizar
% % Valores para Bandera Zona ROJA
% rmin=80;
% rmax=255;
% gmin=0;
% gmax=50;
% bmin=0;
% bmax=50;

% % Valores para Bandera Zona AMARILLA
% rmin=120;
% rmax=180;
% gmin=80;
% gmax=255;
% bmin=0;
% bmax=20;

% Valores para Bandera Zona AZUL
rmin=0;
rmax=45;
gmin=0;
gmax=90;
bmin=50;
bmax=250;

Mr=r>=rmin & r<=rmax; 
Mg=g>=gmin & g<=gmax;
Mb=g>=bmin & b<=bmax;

M= Mr & Mg & Mb; % & esta funcionando como AND

figure(1)
imshow(M)

figure(2)
imshow(I.*uint8(M))%Los pixels que esten en blanco los va a mantener y combertir en rojo