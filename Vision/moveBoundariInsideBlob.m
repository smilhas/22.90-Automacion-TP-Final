function [y] = moveBoundariInsideBlob(blob,cant,L,movePercent)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y=[];
[d,th]=blob.boundary;
centroide=blob.p;
idd=blob.label;
for i=1:cant
    uu=centroide(1)+cos(th(i))*(d(i)+10);%*(1+movePercent);
    vv=centroide(2)-sin(th(i))*(d(i)+10);%*(1+movePercent);
    uu=int16(uu);
    vv=int16(vv);
    if(L(vv,uu)==idd)
        y=[y PointFeature(uu,vv)];
    else
        uu=centroide(1)+cos(th(i))*(d(i)-10);%*(1-movePercent);
        vv=centroide(2)-sin(th(i))*(d(i)-10);%*(1-movePercent);
        uu=int16(uu);
        vv=int16(vv);
        if(L(vv,uu)==idd)
            y=[y PointFeature(uu,vv)];
        end
       
    end
    




end

end

