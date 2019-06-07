load('YaleFaces.mat');

moy = calculMoy(X_train);
X_c = CalculCen(X_train, moy);

[U,lambdas] = eigenfaces(X_c);
sum_lambdas = sum(lambdas);
lambdas_norm = (lambdas / sum_lambdas) * 100;

%x = X_train(:,50);
x = X_train(:,55);
%x = X_test(:,17);
Er = affiche_Reconstruction(x, moy, U);