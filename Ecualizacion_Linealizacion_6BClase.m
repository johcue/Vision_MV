clear 
close all
clc
I= imread('Toy.jpg');
r=I(:,:,1); %Capa roja
g=I(:,:,2); %Capa Verde
b=I(:,:,3); %Capa Azul

Sm=0;
SM=255;
n=1; %Se llama gamma, cambia la calidad de la imagen.  0 y 1, favorece tonalidades blancas. Mayor a 1, favorece las tonalidades oscuras
S=[Sm SM];

%Linealizacion
 %Rojo
 Er=my_stretchlim(r); %ya esta normalizada
 Isr=my_imadjust(r,Er,S/255,n);
 %Verde
 Eg=my_stretchlim(g);
 Isg=my_imadjust(g,Eg,S/255,n);
 %Azul
 Eb=my_stretchlim(b);
 Isb=my_imadjust(b,Eb,S/255,n);

%Ecualizacion 
 %Rojo
 Isre=my_histeq(r);
 %Verde
 Isge=my_histeq(g);
 %Azul
 Isbe=my_histeq(b);

figure(1)
subplot(3,3,1)
imshow(r)
title('Capa Roja', 'Color','r')
subplot(3,3,4)
my_imhist(Isr)
title('Histograma Linealizado')
subplot(3,3,7)
my_imhist(Isre)
title('Histograma Ecualizado')


subplot(3,3,2)
imshow(g)
title('Capa Verde', 'Color','g')
subplot(3,3,5)
my_imhist(Isg)
title('Histograma Linealizado')
subplot(3,3,8)
my_imhist(Isge)
title('Histograma Ecualizado')

subplot(3,3,3)
imshow(b)
title('Capa Azul', 'Color','b')
subplot(3,3,6)
my_imhist(Isb)
title('Histograma Linealizado')
subplot(3,3,9)
my_imhist(Isbe)
title('Histograma Ecualizado')

%Para Combinar la imagen Linealizacion
[F C L]=size(I);%para tener el tamaño de la matriz B
H=uint8(zeros(F,C,L));%F=filas; C=columnas,L=capas
H(:,:,1)=Isr;
H(:,:,2)=Isg;
H(:,:,3)=Isb;

%Para Combinar la imagen Ecualizacion
[F C L]=size(I);%para tener el tamaño de la matriz B
K=uint8(zeros(F,C,L));%F=filas; C=columnas,L=capas
K(:,:,1)=Isre;
K(:,:,2)=Isge;
K(:,:,3)=Isbe;

figure(2)
subplot(2,2,1)
imshow('COLOR.jpeg')
title('Imagen Original')
subplot(2,2,2)
imshow('Filtros.jpg')
title('B&W Superpuestos')
subplot(2,2,3)
imshow(K)
title('Imagen Ecualizada')
subplot(2,2,4)
imshow(H)
title('Imagen Linealizada')
