function [y] = boundary2dots(blob,cant)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=[];
[d,th]=blob.boundary;
centroide=blob.p;
for i=1:cant
    y=[y PointFeature(centroide(1)+cos(th(i))*d(i),centroide(2)-sin(th(i))*d(i))];
end
end

