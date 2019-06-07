function [J] = inversionImage(I)
% renvoie l'image inversée
[N,M] = size(I);
J = I;
for i=1:N
    for j=1:M
        J(i,j) = 255 - I(i,j);
    end
end

end
