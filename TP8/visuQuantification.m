function visuQuantification( Iquant , palette )


Iquantvisu = zeros(size(Iquant,1),size(Iquant,2),3);

for i=1:1:size(Iquant,1)
    for j=1:1:size(Iquant,2)
        Iquantvisu(i,j,1) = palette(Iquant(i,j,1),Iquant(i,j,2),Iquant(i,j,3),1);
        Iquantvisu(i,j,2) = palette(Iquant(i,j,1),Iquant(i,j,2),Iquant(i,j,3),2);
        Iquantvisu(i,j,3) = palette(Iquant(i,j,1),Iquant(i,j,2),Iquant(i,j,3),3);
        
    end
end


Iquantvisu = uint8(Iquantvisu);
figure();
imagesc(Iquantvisu);
axis off;



end