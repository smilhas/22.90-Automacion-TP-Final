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
%p9byn=iread('p9.jpg','double', 'grey');
%figure();idisp(p3byn);
var=iread('p12.jpg','double');%16 12 10
%A=(p9(:,:,2))>=otsu(p9(:,:,2));
%A=(imono(var))>=otsu(imono(var));
A=(imono(var))>=niblack(imono(var),-0.2,20);
A=iopen(iclose(A,kcircle(4)),kcircle(3));
%A=irank(A,5,5);
idisp(A);
[P,L]=iblobs(A,'boundary');
Iu = iconvolve(A,kdgauss(1)); %aplico el kernel de gauss derivado
Iv = iconvolve(A,kdgauss(1)');
A = sqrt( Iu.^2 + Iv.^2 );
idisp(A);

%% Detecto las esquinas de las figuras
X=icorner(A,'nfeat',200);

%% Dilato imagen de blobs para que contenga las esquinas
Ldil=idilate(L, kcircle(4));
idisp(var, 'new');
X.plot;
%% Filtro los puntos que estan sobre los bordes verdes
res=filterNotGreen(var,X);
figure();idisp(var, 'new');
res.plot;

%% Saco los blobs verdes
bVerde=[];
for u=1:length(P)
    if(iblobsIsGreen(res,P(u))==1)
        bVerde=[bVerde P(u)];
    end
end
%%bVerde.plot_box();
bVerde.plot_ellipse();
bVerde.plot();
bVerde.plot_boundary();

