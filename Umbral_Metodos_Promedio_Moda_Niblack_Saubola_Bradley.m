%% Umbral por Metodo del Promedio, Moda, Niblack, Saubola, Bradley
close all
clear 
clc
RGB=imread('paper.jpg');
I=rgb2gray(RGB);
paso=8;%Para reducir el tamaño de la imagen
I=I(1:paso:end, 1:paso:end)

%Tamaño de la ventana
n=15;
m=15;

inif=(n+1)/2; %Inicio Filas
inic=(m+1)/2; %Inicio Columnas

finf=(n-1)/2; %Final Filas, seria negativo, pero con el for se le pone el negativ, se devuelve
finc=(m-1)/2; %Final Columnas, se devuelve

pasof=finf; %Paso Filas
pasoc=finc; %Paso Columnas

Ipad=padarray(I,[finf finc], 'symmetric')%Leo Imagen mas grande
                                         % padarray(A,[1 1]) Pone una fila y una columna mas de ceros
                                         % Replicate replica el valor el ultimo y la repite
                                         % Symmetric repite los numeros del borde hacia adentro
[f c]=size(Ipad);%Encontramos el tamaño de la imagen

Knb=-0.1;%Para Niblack
Ks=0.1;%Saubola
P=15; %Bradley
%Recorremos la Imagen
for i=inif:f-finf %Por el tamaño de la ventana n,m
    for j=inic:c-finc
        v=double(Ipad(i-pasof:i+pasof,j-pasoc:j+pasoc));%Para que recorra desde el 1 hasta el numero final de la matriz
        %Promedio
         T1(i-finf,j-finc)=mean(v(:)); %Sacamos el promedio convirtiendo la matriz en una fila (:) para que haga el promedio de todos los numeros
                               % T(i,j)=sum(v(:))/(n*,m); %Tambien se puede hacer asi
        %Moda
         T2(i-finf,j-finc)=mode(v(:));
        % Niblack
         T3(i-finf,j-finc)=mean(v(:))+Knb*std(v(:)); 
        % Saubola
           T4(i-finf,j-finc)=mean(v(:))*(1+(Ks*(std(v(:))/128-1)));%La imagen es de 255 debido a que es de 8 bits, entonces se divide en la mitad
        %Bradley
        T5(i-finf,j-finc)=sum(v(:))/(n*m)*(1-P/100);
         %Media
         T6(i-finf,j-finc)=median(v(:));
    end
end
bin1=I>=T1;
bin2=I>=T2;
bin3=I>=T3;
bin4=I>=T4;
bin5=I>=T5;
bin6=I>=T6;
figure(1)
subplot(2,3,1)
imshow(I)
title('Imagen Original')
subplot(2,3,2)
imshow(bin1)
title('Umbral Metodo Promedio')
subplot(2,3,3)
imshow(bin2)
title('Umbral Metodo Moda')
subplot(2,3,4)
imshow(bin3)
title('Umbral Metodo Niblack')
subplot(2,3,5)
imshow(bin4)
title('Umbral Metodo Saubola')
subplot(2,3,6)
imshow(bin5)
title('Umbral Metodo Bradley')
