function [pts] = getRectangleCornerPoints(houghLines)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    N = size(houghLines);
    N = N(2);
    
    if (N ~= 4)
        pts = 0;
        return;
    end
    
    [B,I] = sort(abs(houghLines.theta));
    
    A = houghLines(I(1));
    B = houghLines(I(3));
    C = houghLines(I(2));
    D = houghLines(I(4));
    
    syms u;
    lineA = -u*tan(A.theta) + A.rho/cos(A.theta);
    lineB = -u*tan(B.theta) + B.rho/cos(B.theta);
    lineC = -u*tan(C.theta) + C.rho/cos(C.theta);
    lineD = -u*tan(D.theta) + D.rho/cos(D.theta);
    
    ptsA = double(solve(lineA == lineB, u));
    ptsA = [ptsA double(subs(lineA,ptsA(1)))];
    
    ptsB = double(solve(lineB == lineC, u));
    ptsB = [ptsB double(subs(lineB,ptsB(1)))];
    
    ptsC = double(solve(lineC == lineD, u));
    ptsC = [ptsC double(subs(lineC,ptsC(1)))];
    
    ptsD = double(solve(lineD == lineA, u));
    ptsD = [ptsD double(subs(lineD,ptsD(1)))];
    
    pts = [ptsA; ptsB; ptsC; ptsD];
end

