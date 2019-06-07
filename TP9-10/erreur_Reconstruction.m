function [Er] = erreur_Reconstruction(x_r,x)
% x_r : image reconstruite
% x : image d'origine 
% calcule l'erreur de reconstruction entre x_r et x

Er = sqrt(sum((x_r - x).^2));
end

