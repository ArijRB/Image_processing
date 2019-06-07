function [J] = seuillerImage(I,s)
% renvoie l'image I seuillée 
[N,M] = size(I);
J = I;

for i=1:N
    for j=1:M
        if J(i,j) > s
            J(i,j) = 255;
        else
            J(i,j) = 0;
        end
    end
end

end
