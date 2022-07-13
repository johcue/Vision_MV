%% Color HSV-Cilindro
% (Hue-tono (color puro), S-Saturacion, V-Valor ó B-Brillo)
% A veces se representa como un cono
clear
close all
clc
I=imread('cartagena.jpg');

[ h,s,v ]=my_rgb2hsv(I);


%Amarillo 30-60°
%Para H
hmin=30/360; %Normalizamos
hmax=60/360; 

Mh=h>=hmin & h<=hmax; %Masacra para h

%Para S
smin=0.8; 
smax=1; 

Ms=s>=smin & s<=smax; %Masacra para s

%Para V
vmin=0.5; %Normalizamos
vmax=1; 

Mv=v>=vmin & v<=vmax; %Masacra para s

M=Mh & Ms & Mv;

% %Azul 210-280°
% %Para H
% hmin=180/360; %Normalizamos
% hmax=290/360; 
% 
% Mh=h>=hmin & h<=hmax; %Masacra para h
% 
% %Para S Cantidad del blanco
% smin=0.75; 
% smax=1; 
% 
% Ms=s>=smin & s<=smax; %Masacra para s
% 
% %Para V Cantidad del negro
% vmin=0; %Normalizamos
% vmax=1; 
% 
% Mv=v>=vmin & v<=vmax; %Masacra para s
% 
% M=Mh & Ms & Mv;

figure(1)
imshow(M)

figure(2)
imshow(uint8(M).*I)

[Mascara, Imascarada]=MaskAmarillo(I);
figure(3)
imshow(Mascara)

figure(4)
imshow(Imascarada)