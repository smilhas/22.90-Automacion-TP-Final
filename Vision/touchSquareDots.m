function [y] = touchSquareDots(blob)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
y=[];
dotsBoundary=boundary2dots(blob,400);
boxx=blob.box;
delta1=5;
delta2=5;
for i=1:400
    if((dotsBoundary(i).u<=(boxx(1,1)+delta1))||(dotsBoundary(i).u>=(boxx(1,2)-delta2))||(dotsBoundary(i).v<=(boxx(2,1)+delta1))||(dotsBoundary(i).v>=(boxx(2,2)-delta2)))
    y=[y dotsBoundary(i)];
    end
    
end

end

