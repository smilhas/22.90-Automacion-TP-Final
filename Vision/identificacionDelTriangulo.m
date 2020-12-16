%% Start over
clc
clear all

%% Cargo las imagenes
origIm=iread('imagenPlana.jpg','double');
imR = origIm(:,:,1);
imG = origIm(:,:,2);
imB = origIm(:,:,3);

% im=idouble(im);
% im=imono(im);

% figure()
% idisp(im)
% 
% figure()
% ihist(im)
%% Filtrado
% imFilter = ithresh(imG);
% imth = imG > niblack(imG,-0.2,20);
imth = imG > 0.25;
% imth = imG > 0.4;
idisp(imth)
imth = not(imth);
idisp(imth)

% imFilter2 = idilate(imFilter,kcircle(3));
% idisp(imFilter2);

% A=(imono(imFilter))>=niblack(imono(imFilter),-0.2,20);
% A=iopen(iclose(A,kcircle(4)),kcircle(3));
% idisp(A)
%% Identificación del triángulo
imMono=imono(imFilter);
idisp(imMono);
[P,L]=iblobs(imMono);
idisp(P);

%% Pruebas con Hough
% im=idouble(im);


% K=ksobel();
% imbordeh=iconv(im,K);
% imbordev=iconv(im,K');
% imbordenorm=((imbordeh).^2+(imbordev).^2).^0.5;
% idisp(imbordenorm)
% 
% 
% ithresh(imbordenorm)
% imth=imbordenorm>0.14;

% imlin=Hough(imth);
imlin=Hough(imth,'suppress',10);
idisp(imth)
imlin.plot
figure
imlin.lines
x = imlin.lines