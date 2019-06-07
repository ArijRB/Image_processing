function [Q] = fusion_globale(I,S, thresh)
[N,M] = size(I);
B = zeros(N,M);
kmax = full(max(S(:)));
var = 0;
mean = 0;
n = 0;

for k=1:kmax
    [vals,i,j] = qtgetblk(I,S,k);
    if ~isempty(vals)
        for l=1:length(i)
            n1 = n + i(l) * j(l);
            mean1 = (mean * n + min(min(vals(:,:,l))))/n1;
            std1 = n * (var + mean) + i(l) * j(l) * (std2(vals(:,:,l)) + mean2(vals(:,:,l)^2)) / n1;
            std1
            if std1 < thresh
               n = n1;
               mean = mean1;
               var = std1.^2;
               B(i(l):i(l)+k, j(l):j(l)+k) = l; 
            end
        end
    end
end
B = bwlabel(B);
Q = label2rgb(B);
end

