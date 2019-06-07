I = ouvrirImage('lena.gif');

%%% lissage gausien
h_g = gauss(2);
I = convolution(I, h_g);
%figure(1);
%imagesc(I);
%colormap(gray);

%%% filtre de Sobel
[Ix,Iy,IG,IG_s] = filtre_sobel(I,150);
figure(2);
imagesc(IG_s);
colormap(gray);

%%% filtre laplacien
I_laplacien = filtre_laplacien(I,10);
figure(3);
imagesc(I_laplacien);
colormap(gray);