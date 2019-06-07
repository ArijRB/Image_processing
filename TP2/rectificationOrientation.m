I = ouvrirImage('sonrot.gif');
figure(1);
imshow(I);
[Ir, ordom] = rectify_orientation(I);
figure(2);
imshow(Ir);