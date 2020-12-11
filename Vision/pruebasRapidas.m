clear all;
close all;

%% Cargo las imagenes
p=iread('imagenPlana.jpg','double');
p1=iread('p1.jpg','double');
p2=iread('p2.jpg','double');
p3=iread('p3.jpg','double');
p4=iread('p4.jpg','double');
p5=iread('p5.jpg','double');
p6=iread('p6.jpg','double');
p7=iread('p7.jpg','double');
p8=iread('p8.jpg','double');
p9=iread('p9.jpg','double');

%% Muestro imagenes
figure();idisp(p);
figure();idisp(p1);
figure();idisp(p2);
figure();idisp(p3);
figure();idisp(p4);
figure();idisp(p5);
%% Prueba de correccio de perspectiva
pos1=[874 2883 3276 436;640 646 1983 1973];%puntos de las cuatro esquinas
pos2=[436 3276 3276 436;640 640 1983 1983];%donde quiero que esten las cuatro esquinas al fianl
H = homography(pos1, pos2);
p3c=homwarp(H,p3);
%% Chequeo la imagen
figure();idisp(p3);
figure();idisp(p3c);
%% Hay que buscar las 4 esquinas
p9byn=iread('p9.jpg','double', 'grey');
%figure();idisp(p3byn);

A=(p9(:,:,2))>=otsu(p9(:,:,2));
A=(p9byn)>=otsu(p9byn);
%A=idilate(A, kcircle(3));
figure();idisp(A);
[P,L]=iblobs(A);
%size=size(P);
%N=size(2);%Numero de blobs sin tener en cuenta el fondo
%[P,L]=iblobs(A);
Iu = iconvolve( A, kdgauss(1) ); %aplico el kernel de gauss derivado
Iv = iconvolve( A, kdgauss(1)' );
A = sqrt( Iu.^2 + Iv.^2 );
figure();idisp(A);

%% Detecto las esquinas de las figuras
X=icorner(A,'nfeat',100);

%% Dilato imagen de blobs para que contenga las esquinas
%Ldil=idilate(L, kcircle(4));
idisp(p9, 'new')
X.plot

