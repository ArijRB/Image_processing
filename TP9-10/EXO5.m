load('YaleFaces.mat');

moy = calculMoy(X_train);

Xc_train = CalculCen(X_train, moy); % centrer X_train

n_train = size(X_train,2);
n_test = size(X_test,2);
n_noface = size(X_noface,2);

[W,lambdas] = eigenfaces(Xc_train);

N = size(lambdas,1); % nombre de valeurs propres

err_test = zeros(n_test, N);
err_train = zeros(n_train,N);
err_noface = zeros(n_noface,N);

for i=1:n_train
    x = X_train(:,i);
    err = evolution_erreur_reconstruction(x, moy, W, N);
    err_train(i,1:N) = err;
end

for i=1:n_test
    x = X_test(:,i);
    err = evolution_erreur_reconstruction(x, moy, W, N);
    err_test(i,1:N) = err;
end

for i=1:n_noface
    x = X_noface(:,i);
    err = evolution_erreur_reconstruction(x, moy, W, N);
    err_noface(i,1:N) = err;
end

err_max_train = max(err_train);
err_mean_train = mean(err_train,1);

err_max_test = max(err_test);
err_mean_test = mean(err_test,1);

err_mean_noface = mean(err_noface,1);
err_min_noface = min(err_noface);


%{
% erreur moyenne pour le train et le test
figure(1);
plot(x,err_mean_train);
hold on
plot(x,err_mean_test);
title("Erreur moyenne de reconstruction en fonction de K");
legend({'base de référence','base de test'},'Location','southwest');
hold off

% erreur max et moyenne du train
figure(2);
plot(x,err_max_train);
hold on
plot(x,err_mean_train);
title("Erreur de reconstruction des images de référence en fonction de K");
legend({'erreur maximum','erreur moyenne'},'Location','southwest');
hold off

% erreur max et moyenne du test
figure(3);
plot(x,err_max_test);
hold on
plot(x,err_mean_test);
title("Erreur de reconstruction des images de test en fonction de K");
legend({'erreur maximum','erreur moyenne'},'Location','southwest');
hold off
%}

% erreur min des no-face et max du test
figure(4);
plot(err_min_noface');
hold on
plot(err_max_test');
title("Erreur de reconstruction en fonction de K");
legend({'min pour la base de "non-visages"','max pour la base de test'},'Location','southwest');
hold off

% erreur moyenne du test et des no-face
figure(5);
plot(err_mean_noface');
hold on
plot(err_mean_test');
title("Erreur moyenne de reconstruction en fonction de K");
legend({'base de "non-visages"','base de test'},'Location','southwest');
hold off


%{
for i=1:10
    x = X_test(:,i);
    z = calculeProj(x, moy, 30, W);
    x_r = reconstruction(z, moy, 30, W);
    figure(i);
    colormap(gray);
    subplot(1,2,1)
    imagesc(reshape(x,[64,64]));
    title(strcat("départ ", int2str(i)));
    hold on
    subplot(1,2,2)
    imagesc(reshape(x_r,[64,64]));
    title(strcat("reconstruit ", int2str(i)));
    hold off
end
%}
%{
for i=1:10
    x = X_noface(:,i);
    z = calculeProj(x, moy, 30, W);
    x_r = reconstruction(z, moy, 30, W);
    figure(i);
    colormap(gray);
    subplot(1,2,1)
    imagesc(reshape(x,[64,64]));
    title(strcat("départ ", int2str(i)));
    hold on
    subplot(1,2,2)
    imagesc(reshape(x_r,[64,64]));
    title(strcat("reconstruit ", int2str(i)));
    hold off
end
%}