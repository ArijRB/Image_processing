load('YaleFaces.mat');

moy = calculMoy(X_train);
X_c = CalculCen(X_train, moy);

[U,lambdas] = eigenfaces(X_c);

[nbpixels, nbvisages] = size(X_test);

N = size(lambdas,1);
err_test = zeros(nbvisages, N);

for i=1:nbvisages
    x = X_test(:,i);
    err = evolution_erreur_reconstruction(x, moy, U, N);
    err_test(i,1:N) = err;
end

err_mean = mean(err_test,1);
