[I,n,m] = ouvrirImage('Images/moon.tif');
imshow(I);
h = calculerHisto(I);
x = 0:255;
bar(x, h);
I = normaliseImage(I, 10, 50);
h = calculerHisto(I);
bar(x, h);
imshow(I);
