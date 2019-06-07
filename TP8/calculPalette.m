function [ palette,palette2 ] = calculPalette( nH, nS , nV )



cpt=1;
nL = 4;
%nC = nH*nS*nV/nL;

palette = zeros(nH*nS*nV,3);
palette2 = zeros(nH,nS,nV,3);


tH = 1/(2*nH);
tS = 1/(2*nS);
tV = 1/(2*nV);


for k=1:nV
    for j=1:nS
        for i=1:nH
            I = zeros(1,1,3);
            
            HSVval = [ (i-1)/nH + tH , (j-1)/ nS + tS , (k-1)/ nV + tV ];
            RGBval = hsv2rgb(HSVval) .*255;
            
            palette(cpt,:) = RGBval;
            
            palette2(i,j,k,:) = RGBval;
            
            cpt = cpt+1;
            
        end
    end
end



end

