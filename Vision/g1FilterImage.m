function [outImage] = g1FilterImage(threshold, image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    limitsN = size(threshold);
    N = size(image);
    n = N(1);
    m = N(2);
    
    outImage = zeros(n,m);
    if (limitsN == 1)
        for i=1:n
            for j=1:m
                if (image(i,j) > threshold)
                    outImage(i,j) = image(i,j);
                end
            end
        end
    elseif(limitsN == 2)
        for i=1:n
            for j=1:m
                if ((image(i,j) > threshold(1)) || (image(i,j) < threshold(2)))
                    outImage(i,j) = image(i,j);
                end
            end
        end
    else
        outImage = image;
    end
end

