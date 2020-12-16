function [y] = getRepresentativeDots(blob,L)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
is=removeBackgraund(L,blob.label);
Iu = iconvolve(is,kdgauss(1)); %aplico el kernel de gauss derivado
Iv = iconvolve(is,kdgauss(1)');
A = sqrt( Iu.^2 + Iv.^2 );
y=icorner(A,'nfeat',10);
end

