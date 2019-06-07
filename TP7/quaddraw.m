function [Q] = quaddraw(I,S)
% retourne l'image I à laquelle on superpose un 
% quadrillage rouge représentant la décomposition
% Q(i,j) contient (255, 0, 0) si (i,j) est au bord 
% d'une région, (g, g, g) avec g = I(i,j) sinon
            

[N,M] = size(I);
B = zeros(N,M);
kmax = full(max(S(:)));
nb = numreg(S);

for k=1:kmax
    [vals,i,j] = qtgetblk(I,S,k);
    for l=1:length(i)
        B(i(l):i(l)+k, j(l):j(l)+k) = l; 
    end
end

Q = ones(N,M,3);

for i=1:N
    for j=1:M
        g = I(i,j);
        if i == 1 || i == N || j == 1 || j == N
            Q(i,j,:) = [g, g, g];
        else
            if B(i,j) == B(i-1,j-1) && B(i,j) == B(i-1,j) && B(i,j) == B(i-1,j+1) && B(i,j) == B(i,j-1) && B(i,j) == B(i,j+1) && B(i,j) == B(i+1,j-1) && B(i,j) == B(i+1, j) && B(i,j) == B(i+1,j+1)
                Q(i,j,:) = [g, g, g];
            else
                Q(i,j,:) = [255, 0, 0];
            end
        end
    end
end


end

