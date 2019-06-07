I = ouvrirImage('muscle.pgm');
[N,M] = size(I);
I = expand(I);
thresh = 100;
S = qtdecomp(I, thresh);
nb = numreg(S);
Q = fusion_globale(I,S,10^-100);
Q = Q(1:N,1:M);
imagesc(Q);