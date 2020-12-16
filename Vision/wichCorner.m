function [y] = wichCorner(blob)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
y=0;
centroid=blob.p;
boxSq=blob.box;
midBoxU=(boxSq(1,1)+boxSq(1,2))/2;
midBoxV=(boxSq(2,1)+boxSq(2,2))/2;
deltaU=midBoxU-centroid(1);
deltaV=midBoxV-centroid(2);

if ((deltaU>0)&&(deltaV>0))
    y=1;
elseif ((deltaU<0)&&(deltaV>0))
    y=2;
elseif((deltaU<0)&&(deltaV<0))
    y=3;
elseif((deltaU>0)&&(deltaV<0))
    y=4;
end

end

