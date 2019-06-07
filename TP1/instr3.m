[I,n,m] = ouvrirImage('Images/moon.tif');
imshow(I);
h = calculerHisto(I);
x = 0:255;
bar(x, h);
I = seuillerImage(I, 128);
h = calculerHisto(I);
bar(x, h);
imshow(I);
