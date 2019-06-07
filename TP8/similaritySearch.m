clear all;
close all;

global NomImageBase;
global indexQuery;
global Sim;

PathImage = 'Base/';
listima=dir(PathImage);
PathDescriptors= './histos/';

cpt=0;
% Quantif HSV
nH = 12;
nS = 3;
nV = 8;

compute = 1;
if(compute==0)
    for ii=1:length(listima);
        if(listima(ii).isdir==0 && ~strcmp(listima(ii).name(1), '.') )
            filename= listima(ii).name
            I=imread([PathImage,filename]);
            I=double(I);
            I = I  ./ 65535;
            
            % conversion RGB->HSV
            J = rgb2hsv(I);
            % COMPL�TER AVEC VOTRE FONCTION DE CALCUL D'HISTOGRAMME HSV
            [Iq , histo] = quantificationImage(J,nH,nS,nV);
            
            % transformation de l'histogramme en 1 vecteur 1D
            histo = histo(:);
            % COMPL�TER AVEC VOTRE FONCTION DE NORMALISATION D'HISTOGRAMME
            histo = normalisehisto(histo);
            
            Listhist(cpt+1,:) = histo;
            cpt = cpt +1;
            
        end
    end
    
    cpt
    
    nomList = strcat(PathDescriptors,'ListHisto.mat');
    save(nomList,'Listhist');
    
else
    NomImageBase = [ ];
    for ii=1:length(listima);
        if(listima(ii).isdir==0 && ~strcmp(listima(ii).name(1), '.') )
            filename = listima(ii).name;
            nomcomp = strcat(PathImage, filename);
            NomImageBase = strvcat(NomImageBase,nomcomp);
        end
    end
    
    
    nomList = strcat(PathDescriptors,'ListHisto.mat');
    load(nomList);
    cpt = size(Listhist,1);
    d = size(Listhist,2);
    
    
    % Indice de l'image requete
    %indexQuery=350;
    indexQuery=550;
    NomImageBase(indexQuery,:);
    Sim = calculSimilarites(Listhist);
    
    
    AfficheSim_Interactif();
    
    
    
end

