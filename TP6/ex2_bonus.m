I = imread('house2.jpg');
[n, m] = size(I);
e=[5,13,15,19,21,25,31,35,41];
[l]=size(e,2);
R_e=zeros(n, m, l);
Rb_e=zeros(n, m, l);

%On construit une matrice des R et Rb selon différentes échelles
for j=1:l
    R = calculR(I, e(j));
    thresh = mean(R(:)) + 1 * mean(std(R)); 
    Rb = seuilleR(R, thresh);
    R_e(:, :,j)=R;
    Rb_e(:, :,j)=Rb;
end

%suppression de non maxima selon le plan image et selon l'échelle
Rnms_e=Rb_e;
for i = 2:n-1
    for j = 2:m-1
        for k= 2:l-1   
            %On sélectionne la sous-matrice autour du pixel dans les 3
            % dimensions
            t = R_e(i-1:2:i+1, j-1:2:j+1, k-1:2:k+1);
            if any(t(:) > R_e(i, j, k)) 
                Rnms_e(i, j, k) = 0;
            end
         end
     end
end

% Affichage des points avec calcul multi-échelle de w=5
jm5 = affichePts(I,Rnms_e(:, :, 1),5);
%imagesc(jm5)

% Affichage des points avec calcul multi-échelle de w=13
jm13 = affichePts(I,Rnms_e(:, :, 2),13);
%imagesc(jm13)

% Affichage des points avec calcul multi-échelle de w=15
jm15 = affichePts(I,Rnms_e(:, :, 3),15);
%imagesc(jm15)

% Affichage des points avec calcul multi-échelle de w=35
jm35 = affichePts(I,Rnms_e(:, :, 8),35);
%imagesc(jm35)

