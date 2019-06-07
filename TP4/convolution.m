function Im = convolution( h, I )
[i, j] = size(I);
[d1, d2] = size(h);
%On créé une matrice résultat de même taille que la matrice originale
Im=I;
I=imagePad(I,h);
%On fait une rotation d'angle du filtre (de haut en bas puis de droite à gauche)
h = rot90(h,2);
for k=1:i+d1-1
    for l=1:j+d2-1
        Im(k, l) = sum(sum(I(k:k+d1-1,l:l+d2-1) .* h));
    end
end