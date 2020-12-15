function y = isGreen(pixel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
maxPix=0.9;
minPix=0.15;
y=0;
[maxVal,index]=max(pixel);
if (index==2)%chequeo el verde sea el maximo
if((maxVal<maxPix)&&(maxVal>minPix))
    y=1;
end
end
% if(index==3)
%     if(abs(pixel(2)-pixel(3))<0.01)
%         y=1;
%     end
% end

end

