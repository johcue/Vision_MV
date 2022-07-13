close all
clear 
clc
RGB=imread('cartagena.jpg');
I=rgb2gray(RGB);
Isp=imnoise(I, 'salt & pepper', 0.1);
figure(1)
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(Isp)
 

MATLAB_MSE=immse(I,Isp)
MSE=my_MSE(I,Isp)
[PSNR,SNR] = my_psnr(I,Isp)
[MATLAB_psnr,MATLAB_snr] = psnr(I,Isp)


