load('toyHorse1.mat');
load('toyHorse2.mat');

%Question 1 
W = 15;
R1 = calculR(I1, W);
seuil1=mean(R1(:)) + 0.5 * mean(std(R1));
Rb1 = seuilleR(R1,seuil1);
Rnms1 = nms(R1, Rb1);
j1 = affichePts(I1,Rnms1,W);
imagesc(j1)


R2 = calculR(I2, W);
seuil2=mean(R2(:)) + 0.5 * mean(std(R2));
Rb2 = seuilleR(R2,seuil2);
Rnms2 = nms(R2, Rb2);
j2 = affichePts(I2,Rnms2,W);
imagesc(j2)

%Question 2
[dy1,t]=size(unique(I1(:)));
[dy2,t]= size(unique(I2(:)));

%Question 4
Rb21 = seuilleR(R2,seuil1);
Rnms21 = nms(R2, Rb21);
j2_1 = affichePts(I2,Rnms21,W);
imagesc(j2_1) 
