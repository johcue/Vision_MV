close
clear
clc

R=imread('filtro_R.jpeg');
r=R(:,:,1);

figure(1)
subplot(1,3,1)
h=my_imhist(r);
title('Histograma de Frecuencias')
hp=h/sum(h);%Sacamos sum(h) fil*Col que es el total de las clases, y se divide entre cada una, lo cual nos da hp=Histograma de Probabilidad
subplot(1,3,2)
bar([0:255],hp)
axis([0 255 0 max(hp)*0.30])
title('Histograma de Probabilidad')
grid


for i=1:256
    ha(i)=sum(hp(1:i)); %Histograma Acumulado 
    if ha(i)<=0.01
        Em=i;
    end
   if ha(i)<=0.99
        EM=i;
    end
end

subplot(1,3,3)
bar([0:255],ha)
axis([0 255 0 max(ha)*0.30])
title('Histograma de Acumulado')
grid

E=[Em; EM] %streechlim(r) nos entrega normalizados los valores Em EM

%Para el coso Em:24 (0.1) y EM:149(0.9902)