function [realPoints] = getTrianglePointsFromImage(rectangulo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% Cargo las imagenes
%origIm=iread('imagenes_planas/N8.jpg','double');
origIm = rectangulo;
imG = origIm(:,:,1);
imR = origIm(:,:,2);
imB = origIm(:,:,3);

idisp(origIm)
% figure()
% ihist(im)

%% Filtrado esquinas
% ithresh(imG);
imSubs = imG > 0.5;
idisp(imSubs)

%% Filtro triangulo
% ithresh(imR)
imth = imR > otsu(imR);

imth = imSubs & not(imth);

idisp(imth)

imth = idilate(imth,kcircle(5));
idisp(imth);

%% Pruebas con Hough
supress = 0;
N = 4;

while (N > 3)
    supress = supress + 1;
    imlin=Hough(imth,'suppress',supress);
    houghLines = imlin.lines;

    N = size(houghLines);
    N = N(2);
end

idisp(imth)
imlin.plot
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

end

