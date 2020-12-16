function [y] = removeBackgraund(L,label)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
imgSize=size(L);
y=zeros(imgSize);
for v=1:imgSize(1)%%v
    for u=1:imgSize(2)%%u
        if(L(v,u)==label)
            y(v,u)=1;
        end
    end
end


end

