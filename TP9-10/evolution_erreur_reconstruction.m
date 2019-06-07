function [Er] = evolution_erreur_reconstruction(x, x_moy, U, N)
% x_r : image d'origine
% x : image d'origine 
% affiche l'image initiale et la reconstruction obtenue pour plusieurs
%   valeurs de K

Er = zeros(1,N);
for i=1:N
    z = calculeProj(x, x_moy, i, U);
    x_r = reconstruction(z, x_moy, i, U);
    Er(1,i) = erreur_Reconstruction(x_r, x);
end
end
