function [J] = expand(I)
% retourne la plus petite image carrée dont la taille
% est une puissance de deux et qui contient l'image I
[N,M] = size(I);
n = floor(log2(N + 1)) + 1;
mean_I = mean2(I);
J = ones(2^n,2^n) * mean_I;
J(1:N,1:M) = I;
end

