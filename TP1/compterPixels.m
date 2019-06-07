function [nb] = compterPixels(I,k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[n,m]=size(I);
nb=0;
for i=1:n
    for j=1:m
        if I(i,j) == k
            nb=nb+1;
        end
    end
end

