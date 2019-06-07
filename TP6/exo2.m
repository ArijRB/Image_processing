I = imread('house2.jpg');
W = 13;
R = calculR(I, W);
seuil=mean(R(:)) + 0.5 * mean(std(R));
Rb = seuilleR(R,seuil);
Rnms = nms(R, Rb);
j15 = affichePts(I,Rnms,W);
imagesc(j15)
