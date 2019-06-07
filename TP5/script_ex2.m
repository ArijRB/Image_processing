%%% image originale 
I = ouvrirImage('lena.gif');
%figure(1);
%imagesc(I);
%colormap(gray);

%%% image lissée avec un filtre gaussien
I = imgaussfilt(I, 3);

%%% filtre de Sobel
[Ix,Iy,IG,IG_s] = filtre_sobel(I,70);
figure(2);
imagesc(IG_s);
colormap(gray);

%%% orientation
or = orientation(Ix,Iy,IG_s);
figure(3);
imagesc(or);
colormap(jet);

%%% suppression de non maxima
new_Ig = nms(IG,or);
figure(4);
imagesc(new_Ig);
colormap(gray);

