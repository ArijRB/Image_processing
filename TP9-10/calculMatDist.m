function [D] = calculMatDist(Xc_train, Xc_test, W, K)

[p, n] = size(Xc_train);
[q, m] = size(Xc_test);
z_train =W(:,1:K)'* Xc_train;
z_test  = W(:,1:K)'*Xc_test;
D = zeros(n, m);
for i=1:n
    for j=1:m
        t = (z_train(:, i) - z_test(:, j)) .^2;
        D(i, j) = sqrt(sum(t));

    end
end
D = D'; 
end