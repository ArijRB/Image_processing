load('YaleFaces.mat');

moy = calculMoy(X_train);
I = X_test(:,1:5);
I_c = CalculCen(I, moy);
colormap(gray);
figure(1);
imagesc(reshape(moy,[64,64]));
%{
for i=1:5
    figure(i+1)
    colormap(gray);
    imagesc(reshape(X_test(:,i),[64,64]));
end
%}

for i=1:5
    figure(i+1);
    colormap(gray);
    imagesc(reshape(I_c(:,i),[64,64]));
end
 