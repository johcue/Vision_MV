close all
clear 
clc
S=3;
L=19;
Limite=(L-1)/2;

[X Y]=meshgrid(-Limite:Limite,-Limite:Limite);
K1=((1/(2*pi()*S^2))*exp(-(X.^2+Y^2)/(2*S^2)));
K=K1/sum(K1(:));%SIEMPRE DEBE DAR 1
figure(1)
surf(K)