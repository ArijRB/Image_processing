load('YaleFaces.mat');

moy_train = calculMoy(X_train);
Xc_train = CalculCen(X_train, moy_train);

moy_test = calculMoy(X_test);
Xc_test = CalculCen(X_test, moy_test);

[W,lambdas] = eigenfaces(Xc_train);

N = 90;
acc_total = zeros(1,N);

for K=1:90
    D = calculMatDist(Xc_train, Xc_train, W, K);
    %D(logical(eye(N))) = ones(1,N) * Inf; % remplacer la diagonale de 0
    
    if K == 30
        figure(1);
        colormap(gray);
        imagesc(D);
    end
    
    id_train_hat = identification(D);

    n_train = size(id_train_hat,2);
    acc = 0;
    for i=1:n_train
        if (id_train(id_train_hat(i)) == id_train(i))
            acc = acc + 1;
        end
    end
    acc = acc / n_train;
    acc_total(1,K) = acc * 100;
end
figure(2);
plot(acc_total);
