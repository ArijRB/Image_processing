%Question 1
I1 =imread('clown.bmp');
I2 = imread('CLOWN_LUMI.BMP');

%Question 2

%  on selectionne a chaque fois une dimensions
IR = I1(:, :, 1);
IV = I1(:, :, 2);
IB = I1(:, :, 3);

imagesc(IR)
imagesc(IV)
imagesc(IB)

%Question 3
I3 = zeros(size(I1));
I3(:, :, 1) = IV;
I3(:, :, 2) = IR;
I3(:, :, 3) = IB;

%Question 4
R = zeros(size(I1));
G = zeros(size(I1));
B = zeros(size(I1));

R(:, :, 1) = IR;
G(:, :, 2) = IV;
B(:, :, 3) = IB;
