function [Ix,Iy,module,mod_seuille] = filtre_sobel(I, seuil)
Gx = [1, 0, -1; 2, 0, -2; 1, 0, -1];
Gy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
Ix = convolution(I, Gx); 
Iy = convolution(I, Gy);
module = sqrt(Ix.^2 + Iy.^2);
mod_seuille = seuillerImage(module, seuil);
end

