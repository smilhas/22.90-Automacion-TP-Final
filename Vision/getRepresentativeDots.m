function [y] = getRepresentativeDots(blob,L)
%UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
 is=removeBackgraund(L,blob.label);
% Iu = iconvolve(is,kdgauss(1)); %aplico el kernel de gauss derivado
% Iv = iconvolve(is,kdgauss(1)');
% A = sqrt( Iu.^2 + Iv.^2 );
% y=icorner(A,'nfeat',10);
 hh=Hough(is,'suppress',50);
 houghLines=hh.lines;
 N = size(houghLines);
    N = N(2);
    
%     if (N ~= 2)
%         y = 0;
%         return;
%     end
    
    A = houghLines(1);
    B = houghLines(2);   
    syms u;
    lineA = -u*tan(A.theta) + A.rho/cos(A.theta);
    lineB = -u*tan(B.theta) + B.rho/cos(B.theta);

    ptsA = double(solve(lineA == lineB, u));
    ptsA = [ptsA double(subs(lineA,ptsA(1)))];
    
    
    
    y=PointFeature(ptsA(1),ptsA(2));
end

