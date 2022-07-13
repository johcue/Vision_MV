clc
clear 
close all
color=imread('prueba.jpg');
gray=rgb2gray(color);
Ibin=~imbinarize(gray);

%Etiquetado
EE=strel('square',3);%strel crea los Elemento Conector de cinco
Ibind=imclose(Ibin,EE);%dilata y luego hace eroscion


figure(1)
subplot(2,2,1)
imshow(color)
title('Imagen A Color')
subplot(2,2,2)
imshow(gray)
title('Imagen En Grises')
subplot(2,2,3)
imshow(Ibin)
title('Imagen Binaria')
subplot(2,2,4)
imshow(Ibind)
title('Imagen Binaria Dilatada y Eroscionada')


[L N]=bwlabel(Ibind,8);%Devuelve una matriz que devuelve la etiqueta y el numero de cosos encontrados
                       %4 porque hay 4 herramientas
                       
figure(2)
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
    figure(3)
    imshow(uint8(S).*color)%Multiplicamos por la imagen a color normal para que muestre la herramienta
    pause(0.5)
end
