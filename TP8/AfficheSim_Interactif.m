function  AfficheSim_Interactif()

% n = size(noms,1);
% if(n>20)
%     n=20;
% end

global Sim;
global indexQuery;
global NomImageBase;
global Sim;


% Noms des 2O images ppv
global nomsAnnotations;
nomsAnnotations = [];
n =20;

% Lecture de l'image requete
global PathImage;
dep = size(PathImage,2)+1;
nom = NomImageBase(indexQuery,:);
nom = trim(nom);
nomsAnnotations = strvcat(nomsAnnotations,nom(dep:size(nom,2)));
I = imread(nom);

% Labels pour les 20 images ppv à annoter
global labels;
labels = zeros(20,1);


% Création de l'interface d'annotation
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)/8 scrsz(2) 3*scrsz(3)/4 scrsz(4)])
whitebg('white');

% Affichage de l'image requete
subplot(5,4,1);
I = AfficheAnnotations(I,labels(1,1));
imagesc(I);
axis off;

% On trie la base par ordre décroissant de similarité / requete
VecSImInd = Sim(indexQuery,:);
[Y,IndSort] = sort(VecSImInd,'descend');

IndSort(1:20);
cpt =2;
for i=1:n
    % Pour les 2O ppv de l'image requete
    if (cpt>n)
        break;
    end
    if(IndSort(i)~=indexQuery)
        % Lecture de l'image k ppv
        nomi = NomImageBase(IndSort(i),:);
        nomi = remove_blancs(nomi);
        nomsAnnotations = strvcat(nomsAnnotations,nomi(dep:size(nomi,2)));
        %nomsAnnotations(i) = nomi;
        
        I = imread(nomi);
        
        I = AfficheAnnotations(I,labels(cpt,1));
        
        %cpt
        % Affichage de l'iamge k ppv
        subplot(5,4,cpt);
        % Callback de l'affichage apres annotation eventuelle
        imagesc(I,'ButtonDownFcn',{@MouseClikced_Callback,I,nomi,cpt} );
        
        cpt=cpt+1;
        axis off;
    end
    
end

% Création du bouton pour lancer l'apprentissage par LDA
uicontrol('style','pushbutton',...
    'units','normalized',...
    'position',[0.01 0.5 0.1 0.05],...
    'string','NEW QUERY',...
    'callback','randomQuery');

end

