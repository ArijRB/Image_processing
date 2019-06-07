function [Q] = fusion(I,S,thresh)
[N,M] = size(I);
B = zeros(N,M);
kmax = full(max(S(:)));

for k=1:kmax
    [vals,i,j] = qtgetblk(I,S,k);
    if ~isempty(vals)
        for l=1:length(i)
            if std(vals(:,:,l)) < thresh
               B(i(l):i(l)+k, j(l):j(l)+k) = l; 
            end
        end
    end
end
B = bwlabel(B);
Q = label2rgb(B);
unique(B)
end

