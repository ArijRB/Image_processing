I = ouvrirImage('lena.gif');
figure(1);
imagesc(I);
colormap(gray);

s = 70;

[Ix,Iy,module,I_sobel] = filtre_sobel(I,s);
figure(2);
imagesc(I_sobel);
colormap(gray);

I_laplacien = filtre_laplacien(I,s);
figure(3);
imagesc(I_laplacien);
colormap(gray);