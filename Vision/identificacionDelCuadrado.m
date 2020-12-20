%% Start over
clc
clear all

%% Cargo las imagenes
% origIm=iread('imagenPlana.jpg','double');
% Funcionan todas las N, la p8, p9, p14
origIm=iread('N2.jpg','double');
imG = origIm(:,:,1);
imR = origIm(:,:,2);
imB = origIm(:,:,3);

% idisp(origIm)

%% Filtrado de triangulo
% ithresh(imR);
% imTriang = imR > 0.25;
imTriang = imR > 0.63*otsu(imR);
% imTriang = imR > 0.55*otsu(imR);
% imSubs = imR > 0.39;
idisp(imTriang)


%% Filtrado
% ithresh(imG);
imth = imG > otsu(imG);
% imth = imG > 0.5;
imth = imTriang & not(imth);
% imth = imG > 0.4;
idisp(imth)
% imth = not(imth);
% idisp(imth)

imFilter2 = ierode(imth,kcircle(4));
idisp(imFilter2);
imFilter3 = idilate(imFilter2,ones(70));
imFilter4 = ierode(imFilter3,ones(50));
idisp(imFilter4);


% imFilter2 = iopen(imth,kcircle(10));
% imFilter2 = iopen(imth,kcircle(10));
% idisp(imFilter2);


% A=(imono(imFilter))>=niblack(imono(imFilter),-0.2,20);
% A=iopen(iclose(A,kcircle(4)),kcircle(3));
% idisp(A)

%% Pruebas con Hough
imlin=Hough(imFilter4,'suppress',30);
idisp(imFilter4)
imlin.plot
houghLines = imlin.lines;

%% Encuentro los vertices del cuadrado por intersección
pts = getRectangleCornerPoints(houghLines);
hold on
plot(pts(1,1), pts(1,2), 'go','MarkerSize',10)
plot(pts(2,1), pts(2,2), 'go','MarkerSize',10)
plot(pts(3,1), pts(3,2), 'go','MarkerSize',10)
plot(pts(4,1), pts(4,2), 'go','MarkerSize',10)

%% Trasnformación de imágen
pos1=pts';%puntos de las cuatro esquinas
pos2=[500 2000 2000 500;100 100 1000 1000];%donde quiero que esten las cuatro esquinas al fianl
H = homography(pos1, pos2);
plana=homwarp(H,origIm);
% idisp(plana);
%% Recorte de imagen
rectangulo=plana(100:1000,500:2000,:);
idisp(rectangulo)