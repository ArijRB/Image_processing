function [J] = normaliseImage(I,k1,k2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
I=double(I);
I1=min(I(:));
I2=max(I(:));
k=(k2-k1)/(I2-I1);
[n,m] = size(I);
J=round(k*I+k1);
    
end

