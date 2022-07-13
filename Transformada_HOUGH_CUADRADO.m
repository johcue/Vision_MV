%% TRANSFORMADA DE HOUGH PARA CUADRADO (VARIAS LINEAS)
clear  
close all
clc


I=~imbinarize(rgb2gray(imread('cuadrado.jpg')));

figure(1)
imshow(I)
title('La IMAG Binarizada')

[TH, Tmap, Rmap]=hough(I); 

figure(2)
imshow(TH/max(TH(:)),'xdata',Tmap,'ydata',Rmap,'initialmagnification','fit')
title('TRANSFORMADA DE HOUGH')
xlabel('\theta'), ylabel('\rho')
axis on, axis normal, hold on;
colormap(gca,hot);

P=houghpeaks(TH,4); %Encuentra los 4 puntos más brillantes, 4 picos

hold on
plot(Tmap(P(:,2)),Rmap(P(:,1)), 's', 'color', 'yellow', 'linewidth',2);
hold off

lines=houghlines(I,Tmap, Rmap, P, 'FillGap',5,'MinLength',7);

figure(3)
imshow(I)
hold on
for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    switch k
        case 1
        colorlinea=[0 0 1];
        case 2
        colorlinea=[0 1 0];
        case 3
        colorlinea=[1 0 0];
        case 4
        colorlinea=[0 1 1];
    end
    plot(xy(:,1),xy(:,2),'LineWidth', 2, 'Color', colorlinea);
end




