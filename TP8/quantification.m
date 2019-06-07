function [iv] = quantification(v,K)
% effectue une quantification uniforme d'une valeur
% compris entre 0 et 1 avec K intervalles
if v < 1
    iv = floor(v*K) + 1;
else
    iv = K;
end
end

