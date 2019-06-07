load('YaleFaces.mat');

moy = calculMoy(X_train);
X_c = CalculCen(X_train, moy);

[U,lambdas] = eigenfaces(X_c);
sum_lambdas = sum(lambdas);
lambdas_norm = (lambdas / sum_lambdas) * 100;
%{
for i=1:15
    figure(i);
    colormap(gray);
    imagesc(reshape(U(:,i),[64,64]));
end
%}
somme_cumulee = zeros(1,90);
somme_cumulee(1)=lambdas_norm(1);
for i=2:90
    somme_cumulee(i)=somme_cumulee(i-1)+lambdas_norm(i);
end