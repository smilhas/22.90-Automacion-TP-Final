function [y] = getSquareDots(blobs,L)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=[PointFeature(0,0) PointFeature(0,0) PointFeature(0,0) PointFeature(0,0)];
for i=1:length(blobs)
    corNum=wichCorner(blobs(i));
    X=getRepresentativeDots(blobs(i),L);
    squareCorn=getSquareCorner(blobs(i),corNum);%(u v)
    y(corNum)=getMinDot(X,squareCorn);
end

end

