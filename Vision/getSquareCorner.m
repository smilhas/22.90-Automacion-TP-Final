function [y] = getSquareCorner(blob,cornerNumber)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
boxSq=blob.box;
y=[0 0];
switch cornerNumber
    case 1
        y=[boxSq(1,1) boxSq(2,1)];
    case 2
        y=[boxSq(1,2) boxSq(2,1)];
    case 3
        y=[boxSq(1,2) boxSq(2,2)];
    case 4
        y=[boxSq(1,1) boxSq(2,2)];
end
end

