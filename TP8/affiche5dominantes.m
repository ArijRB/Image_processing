function  affiche5dominantes( histo , palette )
[Y,Ind] = sort(histo,'descend');

K=5;

figure();

for i=1:K
    Ind(i);
    Ia = zeros(1,1,3);
    
    Ia(1:1,:,1)  =  palette(Ind(i),1) ;
    Ia(1:1,:,2)  = palette(Ind(i),2)  ;
    Ia(1:1,:,3)  =  palette(Ind(i),3)   ;
    
    Ia = uint8(Ia);
    
    subplot(1,K,i);
    imagesc(Ia);
    axis off;
end



end

