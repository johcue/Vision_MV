%% MORFOLOGIA
% FIT CABE COMPLETAMENTE
% HIT Lo toca parcialmente pues
% Elementos Estructurantes (EE) 
% Erosion (añade ceros) si cabe completamente se vuelve uno si el centro del EE toca la imagen
% Dilatacion (añade unos) si lo toca así sea por un solo pixel, se vuelve uno
% Opening(separa objetos) 1, Erosiona (separa elementos)2, Dilatacion(agranda los elementos
% erosionados)
% Closing (Para elementos separados que se quieran juntar) 1, Dilata y 2, Erosiona
% BordesInternos= Orginal-erosionada
% BordesExternos= Dilatada-Orginal
I=[0 0 0 0 0 0 0 0;
   0 0 0 0 1 1 1 0;
   0 0 1 1 1 1 0 0;
   0 1 1 1 1 0 0 0;
   0 1 1 1 0 0 0 0;
   0 1 1 1 0 0 0 0;
   0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0];
EE=[0 1 0;
    1 1 1;
    0 1 0];
Id=imdilate(I,EE);

figure(1)
subplot(1,3,1)
imshow(I)
title('Imagen Orignal')
subplot(1,3,2)
imshow(Id)
title('Imagen Dilatada')
subplot(1,3,3)
imshow(EE)
title('Elemento Estructural')

%%% EROSION
I=[0 0 0 0 0 0 0 0;
   0 0 0 0 1 1 1 0;
   0 0 1 1 1 1 0 0;
   0 1 1 1 1 0 0 0;
   0 1 1 1 0 0 0 0;
   0 1 1 1 0 0 0 0;
   0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0];
EE=[0 1 0;
    1 1 1;
    0 1 0];
Ie=imerode(I,EE);

figure(2)
subplot(1,3,1)
imshow(I)
title('Imagen Orignal')
subplot(1,3,2)
imshow(Ie)
title('Imagen Dilatada')
subplot(1,3,3)
imshow(EE)
title('Elemento Estructural')

%%%%%%COMBINADO

I=[0 0 0 0 0 1 0 0;
   0 0 0 0 1 1 1 0;
   0 0 0 0 1 1 1 0;
   0 0 0 1 1 0 0 0;
   0 1 1 1 0 0 0 0;
   0 1 1 1 0 0 0 0;
   0 1 1 1 0 0 0 0;
   0 0 0 0 0 0 0 0];
EE=[0 1 0;
    1 1 1;
    0 1 0];
Io=imopen(I,EE);%Erosion y dilatacion

figure(3)
subplot(1,3,1)
imshow(I)
title('Imagen Orignal')
subplot(1,3,2)
imshow(Io)
title('Imagen Dilatada')
subplot(1,3,3)
imshow(EE)
title('Elemento Estructural')

%%%%%%COMBINADO

I=[0 0 0 0 0 0 0 0;
   0 0 0 0 1 1 1 0;
   0 0 0 0 1 1 1 0;
   0 0 0 0 0 0 0 0;
   0 1 1 1 0 0 0 0;
   0 1 1 1 0 0 0 0;
   0 1 1 1 0 0 0 0;
   0 0 0 0 0 0 0 0];
EE=[0 1 0;
    1 1 1;
    0 1 0];
Io=imclose(I,EE);%Erosion y dilatacion

figure(4)
subplot(1,3,1)
imshow(I)
title('Imagen Orignal')
subplot(1,3,2)
imshow(Io)
title('Imagen Dilatada')
subplot(1,3,3)
imshow(EE)
title('Elemento Estructural')

