%% Tecnicas Adaptivas
% Se utilizan para Corregir el Problema del Metodo de OTSU con Sombras
% Por pequeñas ventanas se busca el umbral pixel por pixel
% -Umbral Local Por Metodo del Promedio
% -Umbral Local Por Metodo de la Median
% -Umbral Local Por Metodo del Maximo y el Minimo
% -Umbral Local Por Metodo de la Moda (si hay dos valores con la misma
%                                     ocurrencia me quedo con el mas pequeño)
% -Umbral Local Por Metodo de Niblack
% -Umbral Local Por Metodo de Sauvola
% A=[ 1 2 3 5; 7 3 4 6; 9 6 2 3]
% A =
% 
%      1     2     3     5
%      7     3     4     6
%      9     6     2     3
% 
% A(2:3,2:3)
% 
% ans =
% 
%      3     4
%      6     2