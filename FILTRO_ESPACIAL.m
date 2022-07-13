%% FILTRADO ESPACIAL
% % Filtrado por pixeles
% % Mascaras llamadas kernel
% % Filtros Paso-Bajas (borrosa) Pasa-Alto (resalta detalles, bordes)
% % Pasa-Banda (un detalle especifico)
% % Convolucion, se rota el kernel 180°
% % Correlacion 


close all
clear 
clc
RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);
I=imnoise(I, 'speckle', 0.1);
paso=4;%Para reducir el tamaño de la imagen
I=I(1:paso:end, 1:paso:end)

%Tamaño de la ventana
K=5;
[n m]=size(K);

inif=(n+1)/2; %Inicio Filas
inic=(m+1)/2; %Inicio Columnas

finf=(n-1)/2; %Final Filas, seria negativo, pero con el for se le pone el negativ, se devuelve
finc=(m-1)/2; %Final Columnas, se devuelve

pasof=finf; %Paso Filas
pasoc=finc; %Paso Columnas

Ipad=padarray(I,[finf finc], 'symmetric');
[f c]=size(Ipad);%Encontramos el tamaño de la imagen


%Recorremos la Imagen
for i=inif:f-finf %Por el tamaño de la ventana n,m
    for j=inic:c-finc
        v=double(Ipad(i-pasof:i+pasof,j-pasoc:j+pasoc));%Para que recorra desde el 1 hasta el numero final de la matriz
        %Promedio
         T1(i-finf,j-finc)=mean(v(:)); %Sacamos el promedio convirtiendo la matriz en una fila (:) para que haga el promedio de todos los numeros
                               
        %Moda
         T2(i-finf,j-finc)=mode(v(:));
         
        %Media
         T3(i-finf,j-finc)=median(v(:));
        
    end
end
T1=uint8(T1);
T2=uint8(T2);
T3=uint8(T3);

figure(1)
imshow(I)
title('Imagen Original')

figure(2)
imshow(T1)
title('FILTRO Metodo Promedio')

figure(3)
imshow(T2)
title('FILTRO Metodo Moda')

figure(4)
imshow(T3)
title('FILTRO Metodo Media')

