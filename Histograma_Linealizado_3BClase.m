clear 
close all
clc
I= imread('toy.jpg');
r=I(:,:,1); %Capa roja
g=I(:,:,2); %Capa Verde
b=I(:,:,3); %Capa Azul

Sm=0;
SM=255;
n=1; %Se llama gamma, cambia la calidad de la imagen.  0 y 1, favorece tonalidades blancas. Mayor a 1, favorece las tonalidades oscuras
S=[Sm SM];

%Pal rojo
% Emr=19;%E minimo, desde que empieza la parte gruesa del histograma del eje x
% EMr=94;%E max
Er=my_stretchlim(r); %ya esta normalizada
Isr=my_imadjust(r,Er,S/255,n);

%Pal green
% Emg=4; %8
% EMg=166; %164
Eg=my_stretchlim(g);
Isg=my_imadjust(g,Eg,S/255,n);

%Pal lan v':
% Emb=15; %21
% EMb=172; %172
Eb=my_stretchlim(b);
Isb=my_imadjust(b,Eb,S/255,n);

figure(1)
subplot(3,3,1)
imshow(r)
title('Rojo', 'Color','r')
subplot(3,3,4)
my_imhist(r)
subplot(3,3,7)
my_imhist(Isr)


subplot(3,3,2)
imshow(g)
title('Verde', 'Color','g')
subplot(3,3,5)
my_imhist(g)
subplot(3,3,8)
my_imhist(Isg)

subplot(3,3,3)
imshow(b)
title('Azul', 'Color','b')
subplot(3,3,6)
my_imhist(b)
subplot(3,3,9)
my_imhist(Isb)

%Para Combinar la imagen
[F C L]=size(I);%para tener el tamaño de la matriz B
K=uint8(zeros(F,C,L));%F=filas; C=columnas,L=capas
K(:,:,1)=Isr;
K(:,:,2)=Isg;
K(:,:,3)=Isb;

% %O tambien se puede concatenar
% K=cat(3, Isr, Isg, Isb); %cat es concatenar

figure(2)
subplot(1,2,1)
imshow('COLOR.jpeg')
title('Original')
subplot(1,2,2)
imshow(K)
title('Generada')

% Isrp=my_imadjust([0:1:255],[Emr/255 EMr/255],[Sm/255 SM/255],n);
% 
% figure(3)
% plot(Isrp)

% figure(2)
% my_imhist(r)
% figure(3)
% my_imhist(g)
% figure(4)
% my_imhist(b)

