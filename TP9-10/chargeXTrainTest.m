function [ imatab,imatabtest ] = chargeXTrainTest( PathTrain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


PathTest=[PathTrain 'Test/'];

listima=dir([PathTrain 'Rec_*'] );
listimatest=dir([PathTest 'Rec_*'] );


nl=64;
nc=64;
d=nc*nl;
n=length(listima);

imatab=zeros(nl,nc,n);

%Lecture des images
for ii=1:n;
    filename= listima(ii).name;
    imatab(:,:,ii)=imread([PathTrain,filename]);
end

%lecture du test
ntest=length(listimatest);
imatabtest=zeros(nl,nc,ntest);

for ii=1:ntest;
    filename= listimatest(ii).name;
    imatabtest(:,:,ii)=imread([PathTest,filename]);
end


