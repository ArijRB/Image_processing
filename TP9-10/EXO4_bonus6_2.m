load('YaleFaces.mat');

moy_train = calculMoy(X_train);
Xc_train = CalculCen(X_train, moy_train);
N_train = size(X_train, 1);

[W,lambdas] = eigenfaces(Xc_train);

N = 90;
K = 30;
D = calculMatDist(Xc_train, Xc_train, W, K);
% D_pers : contient 15 sous-matrices correspondant aux distances
% entre visages de personnes différentes

ind = 1;
D_min = ones(14,1) * inf;
D_max = zeros(14,1);

D_2 = D;
D_2(logical(eye(N))) = ones(1,N) * Inf; % remplacer la diagonale de 0

for i=1:6:N-6
    D_min(ind) = min(D_2(i,[1:i-1 i+6:end]));
    D_max(ind) = max(D(i,[1:i-1 i+6:end]));
    ind = ind + 1;
end

min_dist = min(D_min); % dist min entre deux visages de classe différente
max_dist = max(D_max); % dist max entre deux visages de classe différente
