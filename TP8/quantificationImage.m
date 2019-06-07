function [Iq,histo] = quantificationImage(I,nH,nS,nV)
[N,M, z] = size(I);
Iq = zeros(N,M,3);
histo = zeros(nH, nS, nV);

for i=1:N
    for j=1:M
        iH = quantification(I(i,j,1),nH);
        iS = quantification(I(i,j,2),nS);
        iV = quantification(I(i,j,3),nV);
        Iq(i,j,1) = iH;
        Iq(i,j,2) = iS;
        Iq(i,j,3) = iV;
        histo(iH,iS,iV) = histo(iH,iS,iV) + 1;
    end
end
end

