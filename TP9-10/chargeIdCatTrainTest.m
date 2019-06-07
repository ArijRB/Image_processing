function [ idtrain,cattrain,idtest,cattest ] = ChargeIdCatTrainTest( PathTrain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


PathTest=[PathTrain 'Test/'];

listima=dir([PathTrain 'Rec_*'] );
listimatest=dir([PathTest 'Rec_*'] );


nl=64;
nc=64;
n=length(listima);

idtrain=cell(1,n);
cattrain=cell(1,n);
%Lecture des images
for ii=1:n;
    filename= listima(ii).name;
    idtrain(ii)={filename(12:13)};
    cattrain(ii)={filename(15:end)};
end

%lecture du test
ntest=length(listimatest);

idtest=cell(1,ntest);
cattest=cell(1,ntest);
for ii=1:ntest;
    filename= listimatest(ii).name;
    idtest(ii)={filename(12:13)};
    cattest(ii)={filename(15:end)};
end