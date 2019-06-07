function [h] = calculerHisto(I)
% calcule l'histogramme de I
[N,M] = size(I);
h = zeros(1,256);

for i=1:N
    for j=1:M
        h(I(i,j)+1) = h(I(i,j)+1) + 1;
    end
end

end
