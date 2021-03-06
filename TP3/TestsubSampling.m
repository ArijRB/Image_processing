J = ouvrirImage('barbara.png');
f = fftshift(fft2(J));
figure('Name', 'Image originale');
colormap gray;
imagesc(J);

figure('Name', 'FFT originale');
colormap gray;
imagesc(abs(log(1+f)));

for i=1:5
    J = subSampling2(J);
    figure('Name', int2str(i));
    colormap(gray);
    imagesc(J);
    
    f = fftshift(fft2(J));
    figure('Name', int2str(i));
    colormap(gray);
    imagesc(abs(log(1+f)));
end