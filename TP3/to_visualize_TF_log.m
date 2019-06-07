function [Ifv] = to_visualize_TF_log(If)
% renvoie le module centré de la transformée If
Ifv = log(1 + abs(If));
end


