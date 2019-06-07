function [z] = calculeProj(x,x_moy,K,W)
% x : image
% x_moy : image moyenne
% K : dimension
% W : espace de visages 
% calcule les coordonnées z dans le sous-espace W(:,1:K)
z = W(:,1:K)' * (x - x_moy);
end

