function [histon] = normalisehisto(histo)

histon = histo / sqrt(sum(histo.^2));

end

