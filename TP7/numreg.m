function [n] = numreg(S)
% permet de compter le nombre de régions dans
% un découpage Quadtree S
n = size(find(full(S)));
end

