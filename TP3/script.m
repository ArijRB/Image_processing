A = 10;
theta = 45;
%theta = 10;
L = 512;
T0 = 64;

imO = sinusoid2d(A,theta,L,T0,1);
figure(1);
imshow(imO);

fm_t = (1/T0) * cos(theta);
fm_u = (1/T0) * sin(theta);

fm = max(fm_t, fm_u);
%fe = 16 * fm;
%fe = 5 * fm;
fe = 4 * fm;
%fe = (3/2) * fm;

imE = sinusoid2d(A,theta,L,T0,1/fe);
figure(2);
imagesc(imE);
colormap(gray);

TF = compute_FT(imE);
spectre = to_visualize_TF(TF);
spectre = fftshift(spectre);

figure(3);
imagesc(spectre);
colormap(gray);

figure(4);
mesh(spectre);

imR = shannon_interpolation(imE,L,1/fe);
figure(5);
imshow(imR);

err = erreur(imR, imO, A)