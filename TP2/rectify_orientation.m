function [Ir,ordom] = rectify_orientation(I)
TF = compute_FT(I); 
M = to_visualize_TF(TF); % module de TF
Mb = seuillerImage(M, 300000); % seuillage de M
Mb = fftshift(Mb); % mise au centre des basses fréquences
[Ior,ordom] = orientationDominante(Mb); % orientation dominante de Mb
Ir = rotationImage(I, -ordom);
end

