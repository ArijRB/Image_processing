function [M] = filtre_laplacien(I,seuil)
[n,m] = size(I);
L = [0, 1, 0; 1, -4, 1; 0, 1, 0];
IL = convolution(I, L);
M = zeros(n,m);

for i=2:n-1
    for j=2:m-1
        sous_mat = IL(i-1:i+1, j-1:j+1);
        max_IL = max(max(sous_mat));
        min_IL = min(min(sous_mat));

        if ((max_IL > 0) && (min_IL < 0) && ((max_IL -min_IL) > seuil))
            M(i,j) = 1;
        end
    end
end

end

