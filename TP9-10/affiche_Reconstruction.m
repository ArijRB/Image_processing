function [Er] = affiche_Reconstruction(x, x_moy, U)
% x_r : image d'origine
% x : image d'origine 
% affiche l'image initiale et la reconstruction obtenue pour plusieurs
%   valeurs de K
figure(1);
colormap(gray);
imagesc(reshape(x,[64,64]));

title("Image originale");
K_ = [5, 10, 25, 50, 90];
Er = zeros(1,5);
for i=1:5
    k = K_(i);
    z = calculeProj(x, x_moy, k, U);
    x_r = reconstruction(z, x_moy, k, U);
    Er(1,i) = erreur_Reconstruction(x_r, x);
    figure(k);
    colormap(gray);
    imagesc(reshape(x_r,[64,64]));
    title(strcat("Image ", int2str(k)));
end
end



