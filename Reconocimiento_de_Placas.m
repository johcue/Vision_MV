%% Reconocimiento de Placas
clc
clear 
close all
% Icolor=imread('placa1.jpg'); %placa4, %Sí se cambia la imagen,se debe cambiar la Mascara y el area del bwareaopen (para el de las motos sera de 2000)
% figure (1)
% imshow(Icolor)
%Para enderezar la imagen
% puntoInicial=ginput(4)%Se marcan 4 puntos inicales
% puntoFinal=ginput(4)%Se marcan 4 puntos finales
% M=cp2tform(puntoInicial, puntoFinal,'projective');
% Icolor=imtransform(Icolor,M);
% Para Abrir Cualquier archivo
[file path]=uigetfile('*.jpg','Seleccionar Imagen..')%Para seleccionar la imagen
Icolor=imread(strcat(path,file));


[Ibin,maskedRGBImage] = Mascara_Placa(Icolor); %Segmentamos por color

%Etiquetado
Ibind=bwareaopen(~Ibin,250); 


figure(2)
subplot(1,3,1)
imshow(Icolor)
title('Imagen A Color')
subplot(1,3,2)
imshow(Ibin)
title('Imagen Binaria')
subplot(1,3,3)
imshow(Ibind)
title('Imagen Binaria Eroscionada y Dilatada ')


[L N]=bwlabel(Ibind,8);%Devuelve una matriz que devuelve la etiqueta y el numero de cosos encontrados
                       %4 porque hay 4 herramientas
                       
figure(3)
subplot(3,1,1)
imshow(L)%Muestra la imagen en double (las imag estan entre 0 y 1)
title('Imagen en BW')
subplot(3,1,2)
imshow(L/N)%Muestra la tonalidad de las etiquetas en esqcala de  grises
title('Imagen en escala de grises')
subplot(3,1,3)
imshow(label2rgb(L))%colorea las etiquetas
title('Imagen Colorea las etiquetas')



%Segmentacion
%Muestreme solo lo que tenga la etiqueta 1 o la 2 o la 3 etc 
for e=1:N % o 2 o 3 o 4
    S=L==e;%Tome la matriz L y los que sean igual a 1 los asigne a S y los que no sean cero
    figure(4)
    imshow(uint8(S).*Icolor)%Multiplicamos por la imagen a color normal para que muestre la herramienta
    pause(0.5)
end


