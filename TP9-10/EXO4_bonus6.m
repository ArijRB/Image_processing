load('YaleFaces.mat');

moy_train = calculMoy(X_train);
Xc_train = CalculCen(X_train, moy_train);
N_train = size(X_train, 1);

[W,lambdas] = eigenfaces(Xc_train);

N = 90;
K = 30;
D = calculMatDist(Xc_train, Xc_train, W, K);
% D_pers : contient 15 sous-matrices correspondant aux distances
% entre visages de la même personne
D_pers = zeros(6, 6, 15); % 6 catégories par personne et 15 personnes
ind = 1;

for i=1:6:90
    D_pers(:,:,ind) = D(i:i+5, i:i+5);
    ind = ind + 1;
end

D_pers2 = D_pers;
% remplacer les 0 de la diagonale de chaque sous-matrice
for i=1:15
    M = D_pers(:,:,i);
    M(logical(eye(6))) = ones(1,6) * Inf;
    D_pers2(:,:,i) = M;
end

D_max = max(max(D_pers));
D_min = min(min(D_pers2));

min_dist = min(D_min); % dist min entre deux visages de même classe
max_dist = max(D_max); % dist max entre deux visages de même classe