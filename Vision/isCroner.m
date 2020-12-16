function [y] = isCroner(img,dots)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
numberTest=length(dots);
y=0;
for i=1:numberTest
    if(isGreen(img(dots(i).v,dots(i).u,:))==1)
        y=y+1;
    end
end
if(y>(numberTest/2))
    y=1;
else
    y=0;
end
end

