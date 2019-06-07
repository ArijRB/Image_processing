I1 = ouvrirImage('son.gif');
I2 = ouvrirImage('sonrot.gif');
TF1 = compute_FT(I1);
TF2 = compute_FT(I2);

Ifv1 = to_visualize_TF(TF1);
Ifv2 = to_visualize_TF(TF2);

Ifv1log = to_visualize_TF_log(TF1);
Ifv2log = to_visualize_TF_log(TF2);

Ifv1log = normaliseImage(Ifv1log, 0, 1);
Ifv2log = normaliseImage(Ifv2log, 0, 1);

figure(1);
imshow(Ifv1log);

figure(2);
imshow(Ifv2log);

Ifv1 = fftshift(Ifv1);
Ifv2 = fftshift(Ifv2);

Ifv1 = seuillerImage(Ifv1, 300000);
Ifv2 = seuillerImage(Ifv2, 300000);

Ifv1 = normaliseImage(Ifv1, 0, 1);
Ifv2 = normaliseImage(Ifv2, 0, 1);

figure(3);
imshow(Ifv1);

figure(4);
imshow(Ifv2);

I3 = blend(I1, I2, 0.5);

figure(5);
imshow(I3);

TF3 = compute_FT(I3);
Ifv3 = to_visualize_TF(TF3);
Ifv3 = fftshift(Ifv3);
Ifv3 = seuillerImage(Ifv3, 300000);
Ifv3 = normaliseImage(Ifv3, 0, 1);

figure(5);
imshow(Ifv3);