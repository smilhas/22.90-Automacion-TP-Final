function [outImage] = g1FilterImage(threshold, image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    limitsN = size(threshold);
    N = size(image);
    n = N(1);
    m = N(2);
    
    if (limitsN == 1)
        for i=1:n
            for j=1:m
                if (image(i,j) threshold)
                outImage(i,j) = 
            end
        end
    elseif(limitsN == 2)
        
    else
        outImage = image;
    end
end

