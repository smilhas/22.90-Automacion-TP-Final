function [y] = getMinDot(x,sqareDot)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
temp=[];
for i=1:length(x)
    temp=[temp sqrt(((sqareDot(1)-x(i).u)^2)+((sqareDot(2)-x(i).v)^2))];
end
[M,I]=min(temp);
y=x(I);

end

