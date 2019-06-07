function [ Iori , orimax] = orientationDominante( I )

[n,m] = size(I);

taille = 32;
ori = zeros(taille,2);
for i=1:taille
    ori(i,1) =  cos(pi*(i-1)/taille);
    ori(i,2) =  sin(pi*(i-1)/taille);
end

precision = pi/taille*180;

Iori = zeros(n,m);

cpt = zeros(taille,1);

    for i=1:n
        for j=1:m
            if(I(i,j)>0)
                v = [ j - m/2 ; - i + n/2  ];
                if(i>(n/2))
                    v = -v;
                end                
                prod = ori * v;
                
                maxi = max(prod);
                if(maxi>0)
                    imax = find(prod== max(prod));
                    Iori(i,j) = imax; 
                    cpt(imax) = cpt(imax)+1;
                end
                
            end
        end
    end

    maxiori = max(cpt);
    %cpt
    orimmax = find(cpt==maxiori);
    orimax = -1*(90 - 180*(orimmax-1)/taille); % pour avoir l'angle par rapport à la verticale (avec la meme convention de signe que imrotate)
    %orimax = radtodeg( pi*(orimmax-1)/taille);
    
end

