clear all;
close all;

%% Abro la imagen a analizar
img=iread('N2.jpg','double'); 

%% Acondiciono la imagen para analizar los blobs

A=(imono(img))>=niblack(imono(img),-0.2,20);
A=iopen(iclose(A,kcircle(4)),kcircle(3));

%% Hallo los blobs
[P,L]=iblobs(A,'boundary','area',[600,30999]);
%% Impirmo los resultados
%idisp(L);
%P.plot_box();
%% Busco los blobs que esten sobre algo verde
%[D,TH]=P(1).boundary;
%dotRes=boundary2dots(P(1),100);
%dotInside=moveBoundariInsideBlob(P(1),100,L,0.1);
%%idisp(L)
%%dotInside.plot()
%% Encuentro los blobs que corresponden a las esquinas
corners=[];
for i=1:length(P)
    dotI=moveBoundariInsideBlob(P(i),100,L,0.1);
    if(isCroner(img,dotI)==1)
        corners=[corners P(i)];
    end
end
%idisp(img);
%corners.plot_box();

if(length(corners)~=4)
   error('Error en la deteccion de objetos'); 
end
%% Hubicacion del punto de la esquina
%j=4;
%cornerDots=touchSquareDots(corners(j));
%idisp(L)
%corners(j).plot();
%corners(j).plot_box();
%cornerDots.plot();
% is=removeBackgraund(L,corners(j).label);
% Iu = iconvolve(is,kdgauss(1)); %aplico el kernel de gauss derivado
% Iv = iconvolve(is,kdgauss(1)');
% A = sqrt( Iu.^2 + Iv.^2 );
% X=icorner(A,'nfeat',10);
%X=getRepresentativeDots(corners(4),L);
ddots=getSquareDots(corners,L);
%idisp(L)
%ddots.plot();

%% Pongo la imagen de frente
c1=ddots(1).p;
c2=ddots(2).p;
c3=ddots(3).p;
c4=ddots(4).p;
pos1=[c1(1) c2(1) c3(1) c4(1);c1(2) c2(2) c3(2) c4(2)];%puntos de las cuatro esquinas
pos2=[500 2000 2000 500;100 100 1000 1000];%donde quiero que esten las cuatro esquinas al fianl
H = homography(pos1, pos2);
plana=homwarp(H,img);
%idisp(plana);
%% Separa la parte de interes de la imagen

rectangulo=plana(100:1000,500:2000,:);
idisp(rectangulo);
