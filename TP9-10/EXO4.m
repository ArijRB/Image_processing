load('YaleFaces.mat');

moy_train = calculMoy(X_train);
Xc_train = CalculCen(X_train, moy_train);

moy_test = calculMoy(X_test);
Xc_test = CalculCen(X_test, moy_test);

[W,lambdas] = eigenfaces(Xc_train);

N = 90;
acc_total = zeros(1,N);

for K=1:90
    D = calculMatDist(Xc_train, Xc_test, W, K);
    id_test_hat = identification(D);

    n_test = size(id_test_hat,2);
    acc = 0;
    for i=1:n_test
        if (id_train(id_test_hat(i)) == id_test(i))
            acc = acc + 1;
        end
    end
    acc = acc / n_test;
    acc_total(1,K) = acc * 100;
end

plot(acc_total);
