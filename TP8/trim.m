function [ nom ] = trim( nom )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%length(nom)
while( strcmp(nom(length(nom)),' ') )
    nom = nom(1:length(nom)-1);
end

end

