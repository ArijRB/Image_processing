function [new_Ig] = nms(Ig,Ior)
% Ig : image du module du gradient
% Ior : image de l'orientation des gradients 
% renvoie une image du module du gradient où seuls
% les extrema locaux sont conservés
[n,m] = size(Ig);
zeros_c = zeros(n,1);
zeros_l = zeros(1, m+2);
Ig2 = [zeros_c Ig zeros_c];
Ig2 = [zeros_l; Ig2; zeros_l];
new_Ig = zeros(n,m);

for i=2:n+1
    for j=2:m+1
        or = Ior(i-1,j-1);
        v = Ig2(i,j);
        if or == 1 % ouest, est
            v1 = Ig2(i,j-1);
            v2 = Ig2(i,j+1);
        elseif or == 2 % nord-est, sud-ouest
            v1 = Ig2(i-1,j+1);
            v2 = Ig2(i+1,j-1);
        elseif or == 3 % nord, sud
            v1 = Ig2(i-1,j);
            v2 = Ig2(i+1,j);
        elseif or == 4 % nord-ouest, sud-est
            v1 = Ig2(i-1,j-1);
            v2 = Ig2(i+1,j+1);
        else
            continue
        end
        
        if (v > v1) && (v > v2)
            new_Ig(i-1,j-1) = 255;
        end
    end
end
end

