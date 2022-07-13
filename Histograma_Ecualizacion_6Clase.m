%Ecualizacion del Histograma
%Produce  el mejor contraste posible de la imagen (procesamiento)
%Que el histograma quede plano, todas las probabilidades quedan estiradas
%entre 0 y 255, y todas las intensidades deben estar
%K=2^8 en una imagen de 8 bits
%Is intensidad de ajuste del hist de salida ecualizado 
%He histograma acumulado
I1= imread('toy.jpg');
r=I1(:,:,1); %Capa roja

figure(1)
subplot(2,2,1)
imshow(r)
subplot(2,2,2)
imhist(r)
Isre=my_histeq(r);
subplot(2,2,3)
imshow(Isre)
subplot(2,2,4)
imhist(Isre)