function [J] = egalisationHistogramme(I,h)
% renvoie l'image après égalisation
[N,M] = size(I);
J = I;
Hc = zeros(1,256);
Hc(1) = h(1);
for i=2:256
    Hc(i) = Hc(i-1) + h(i);
end

for i=1:N
    for j=1:M
        k = I(i,j);
        J(i,j) = int8(255/(N*M) * Hc(k));
    end
end
end