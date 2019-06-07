function [I, n, m] = ouvrirImage(nom)
% OuvrirImage : ouvre l'image, la renvoie ainsi que sa taille
I = imread(nom);
[n,m] = size(I);
end

