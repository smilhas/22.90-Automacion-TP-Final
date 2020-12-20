%% Start over
% clc
% clear all

%% Cargo las imagenes
% origIm=iread('imagenPlana.jpg','double');
origIm = rectangulo;
imG = origIm(:,:,1);
imR = origIm(:,:,2);
imB = origIm(:,:,3);

idisp(origIm)
% figure()
% ihist(im)
%% Filtrado esquinas
% imFilter = ithresh(imG);
imSubs = imG > otsu(imG);
idisp(imSubs)

%% Filtro triangulo
% ithresh(imR)
imth = imR > otsu(imR);
% imth = imR > 0.3;
% imth = imR > 0.4;

imth = imSubs & not(imth);

idisp(imth)

imth = idilate(imth,kcircle(5));
idisp(imth);

% A=(imono(imFilter))>=niblack(imono(imFilter),-0.2,20);
% A=iopen(iclose(A,kcircle(4)),kcircle(3));
% idisp(A)
%% Identificación del triángulo
% imMono=imono(imFilter);
% idisp(imMono);
% [P,L]=iblobs(imMono);
% idisp(P);

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
% N = [200, 20];
% imlin=Hough(imth,'nbins',N);
% imlin=Hough(imth,'interpwidth',5);
imlin=Hough(imth,'suppress',10);
idisp(imth)
imlin.plot
houghLines = imlin.lines;
%% Encuentro los vertices del triángulo por intersección
pts = getTriangleCornerPoints(houghLines);
hold on
plot(pts(1,1), pts(1,2), 'go','MarkerSize',10)
plot(pts(2,1), pts(2,2), 'go','MarkerSize',10)
plot(pts(3,1), pts(3,2), 'go','MarkerSize',10)

%% Multiplicador de escala
uFactor = 20/1500;
vFactor = 15/900;
realPoints = [uFactor*pts(:,1) vFactor*pts(:,2)];