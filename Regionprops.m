%% TRATAMIENTO DIGITAL  DE IMAGENES
% Estraccion de Caracteristicas
% Caracteristicas Geometricas (de Forma)
% Area Momento de Orden Cero, el area (integrales de inercia con respecto al
                              % pixel y la intensidad del pixel)
% Perimetro, Proyecto el perimetro y sumo los unos delos bordes de la imagen
  %Ver etiquetado_ Segmentacion
% Relacion de Delgadez
% Numero de Euler, No es el nN.e que conocemos sino es el #deObjetos menos
  % #deHuecos, puede dar negatico
% Centro de Area
% Eje del Momento Secundario Minimo
% Relacion de Aspecto
% Con estas caracteristicas se crea un Vector, denominado Vector de
% Caracteristicas

clc
clear 
close all
color=imread('tools.jpg');
gray=rgb2gray(color);
% Ibin=~imbinarize(gray);
[BW,maskedRGBImage] = Mask_Tools(color);
EE=strel('disk',3);%strel crea los Elemento Conector de cinco
Ibind=imclose(BW,EE);%dilata y luego hace eroscion


figure(1)
subplot(2,2,1)
imshow(color)
title('Imagen A Color')
subplot(2,2,2)
imshow(gray)
title('Imagen En Grises')
subplot(2,2,3)
imshow(BW)
title('Imagen Binaria')
subplot(2,2,4)
imshow(Ibind)
title('Imagen Binaria Dilatada y Eroscionada')


[L N]=bwlabel(Ibind,4);%Devuelve una matriz que devuelve la etiqueta y el numero de cosos encontrados
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

for e=1:N % o 2 o 3 o 4
        S=L==e;%Tome la matriz L y los que sean igual a 1 los asigne a S y los que no sean cero

        % Las Caracteristicas
        C=regionprops(S, 'Area','Perimeter','Centroid','BoundingBox','ConvexHull',...
            'MajorAxisLength', 'MinorAxisLength', 'Orientation', 'Image', 'FilledImage', 'ConvexImage', 'ConvexArea');
            %BoundingBox es una caja que rodea al objeto, son 4 valores los primeros son dos puntos arriba y los otras 2 son el ancho y el alto  
            %FilledImage hace algo similar a la funcion imclose, pues llena los huecos
            %ConvexHull Rodea el objeto
            %ConvexImage La imagen del area del ConvexHull
            %ConvexArea El area del ConvexImage
        M=uint8(S).*color;

        figure(3)
        imshow(M)%Multiplicamos por la imagen a color normal para que muestre la herramienta
        text(C.Centroid(1),C.Centroid(2),num2str(C.Area), 'Color','white','FontWeight',...
            'bold','FontSize',20)%Coloca los puntos del centroide(x(1),y(2)) el area de la figura
        hold on
        plot(C.Centroid(1),C.Centroid(2), 'w*') %El centroide 
        rectangle('Position',C.BoundingBox, 'EdgeColor','r','LineWidth',2 );%El BondingBox
        xc=floor(C.ConvexHull(:,1));
        yc=floor(C.ConvexHull(:,2));
        plot(xc,yc,'-y')%Ponemos el ConvexHull

        %Elipse
        phi=linspace(0,2*pi,50);
        cosphi=cos(phi);
        sinphi=sin(phi);

        xbar=C.Centroid(1); %Punto de corte X
        ybar=C.Centroid(2);%Punto de Corte Y

        a=C.MajorAxisLength/2;
        b=C.MinorAxisLength/2;

        theta=pi*C.Orientation/180;
        R=[cos(theta) sin(theta)
           -sin(theta) cos(theta)];

       xy=[a*cosphi; b*sinphi];
       xy=R*xy;

       x=xy(1,:)+xbar;
       y=xy(2,:)+ybar;

       plot(x,y,'b','LineWidth',2);

       %pause(1) 
       waitforbuttonpress;

%        figure(4)
%        imshow(C.Image)
%        figure(5)
%        imshow(C.FilledImage)
%        figure(6)
%        imshow(C.ConvexImage)
end






