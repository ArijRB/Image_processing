function [x_r] = reconstruction(z,x_moy,K,W)
% z : projection d'une image dans W(:,1:K)
% x_moy : image moyenne
% K : dimension
% W : espace de visages 
% calcule les coordonnées de l'image projetée dans l'espace de départ
x_r = x_moy + W(:,1:K) * z;
end