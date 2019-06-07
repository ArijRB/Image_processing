function [J] = remplacerPixels(I, k1, k2)
% remplacerPixels renvoie l'image correspondant à I 
% quand on a changé les valeurs k1 en k2
[n,m] = size(I);
J = I;
for i=1:n
    for j=1:m
        if I(i,j) == k1
            J(i,j) = k2;
        end
    end
end
end


