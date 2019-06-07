function [eps] = erreur(xr,xd,A)
% calcule l'erreur moyenne relative de reconstrucion
eps = 0;
[L,M] = size(xr);

for k=1:L
    for l=1:L
        eps = eps + abs(xr(k,l) - xd(k,l));
    end
end
eps = eps / (2*A*L*L);
end

