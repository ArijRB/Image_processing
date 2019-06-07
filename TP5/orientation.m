function [ or ] = orientation(Ix,Iy ,I)
% I : image du module du gradient 
% Ix, Iy : dérivées directionnelles 
% retourne l'image de l'orientation des gradients 

N = 4;
[l,c] = size(I);
or = zeros(size(I));

taille = N;
ori = zeros(taille,2);
for i=1:taille
    ori(i,1) =  cos(pi*(i-1)/taille);
    ori(i,2) =  sin(pi*(i-1)/taille);
end

for i=1:l
    for j=1:c
        if(I(i,j)>0)
            
            v = [ Ix(i,j) ; -Iy(i,j) ] ./ I(i,j);
            
            
            if(Iy(i,j)>0)
                v = -v;
            end
            
            prod = ori * v;
            
            maxi = max(prod);
            
            res = find(prod== maxi); 
            
            or(i,j) = res;
            
        else
            or(i,j) = 0;
        end
    end
end


end


