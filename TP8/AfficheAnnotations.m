function [ I ] = AfficheAnnotations( I , border)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

maxall = max(max(max(I)));

taille = 20;

m = size(I,2);
n = size(I,1);

if(border==1)
    I(1:taille,:,1) = 0;
    I(1:taille,:,2) = maxall;
    I(1:taille,:,3) = 0;
     
    I(n-taille+1:n,:,1) = 0;
    I(n-taille+1:n,:,2) = maxall;
    I(n-taille+1:n,:,3) = 0;
    
    I(:,1:taille,1) = 0;
    I(:,1:taille,2) = maxall;
    I(:,1:taille,3) = 0;
    
    I(:,m-taille+1:m,1) = 0;
    I(:,m-taille+1:m,2) = maxall;
    I(:,m-taille+1:m,3) = 0;
    
elseif(border==2)
    I(1:taille,:,2) = 0;
    I(1:taille,:,1) = maxall;
    I(1:taille,:,3) = 0;
     
    I(n-taille+1:n,:,2) = 0;
    I(n-taille+1:n,:,1) = maxall;
    I(n-taille+1:n,:,3) = 0;
    
    I(:,1:taille,2) = 0;
    I(:,1:taille,1) = maxall;
    I(:,1:taille,3) = 0;
    
    I(:,m-taille+1:m,2) = 0;
    I(:,m-taille+1:m,1) = maxall;
    I(:,m-taille+1:m,3) = 0;       
        
end
    
end

