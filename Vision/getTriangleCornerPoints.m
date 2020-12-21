function [pts] = getTriangleCornerPoints(houghLines)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    syms u;
    lineA = -u*tan(houghLines(1).theta) + houghLines(1).rho/cos(houghLines(1).theta);
    lineB = -u*tan(houghLines(2).theta) + houghLines(2).rho/cos(houghLines(2).theta);
    lineC = -u*tan(houghLines(3).theta) + houghLines(3).rho/cos(houghLines(3).theta);
    
    ptsA = double(solve(lineA == lineB, u));
    ptsA = [ptsA double(subs(lineA,ptsA(1)))];
    
    ptsB = double(solve(lineA == lineC, u));
    ptsB = [ptsB double(subs(lineA,ptsB(1)))];
    
    ptsC = double(solve(lineB == lineC, u));
    ptsC = [ptsC double(subs(lineB,ptsC(1)))];
    
    pts = [ptsA; ptsB; ptsC];
end

