function [y] = iblobsIsGreen(greenDots,blob)
%UNTITLED Summary of this function goes here
%  puntos que corresponden a las formas verdes
gDSize=length(greenDots);
y=0;
boxx=blob.box();
for i=1:gDSize
    cdot=greenDots(i);
    if((dotBelongSquare(boxx(1,2),boxx(1,1),cdot.u)==1)&&(dotBelongSquare(boxx(2,2),boxx(2,1),cdot.v)==1))
    y=1;
    break;
    end
end

end

