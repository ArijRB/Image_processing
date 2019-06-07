clear all;
close all;

PathImage = 'Base/';

nom = 'Paysages67.png';
%nom = 'Voitures76.png';
%nom = 'Avions83.png';

% Quantif HSV
%nH = 12;
%nS = 3;
%nV = 8;
nH = 120;
nS = 30;
nV = 80;

filename= nom;
I=imread([PathImage,filename]);
I=double(I);
I = I ./ 65535;

figure();
imagesc(I);

% conversion RGB->HSV
J = rgb2hsv(I);

[ palette,palette2 ] = calculPalette( nH, nS , nV );

% COMPL�TER AVEC VOTRE FONCTION DE CALCUL D'HISTOGRAMME HSV
[Iq , histo] = quantificationImage(J,nH,nS,nV);

% Visualisation de l'image quantifi�e
visuQuantification( Iq , palette2);

% transformation de l'histogramme en 1 vecteur 1D
histo = histo(:);
% COMPL�TER AVEC VOTRE FONCTION DE NORMALISATION D'HISTOGRAMME
histo = normalisehisto(histo);

figure();
plot(histo);


affiche5dominantes( histo , palette )
[Y,Ind] = sort(histo,'descend');



