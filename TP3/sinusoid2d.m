
function image = sinusoid2d(amplitude, theta,taille, TO,Te)

f0 = 1/TO; 
theta1 = theta/180*pi;

if(Te==1)
    image = zeros(taille,taille);
    for i=1:Te:taille;
        for j=1:Te:taille;
            in =  (i-1)*cos(theta1) - (j-1)*sin(theta1);
            image(i,j) = ( amplitude * cos(2*pi*(f0*in)));
        end
    end
else
    image = zeros(floor(taille/Te),floor(taille/Te));
    for i=1:Te:taille;
        for j=1:Te:taille;
            in =  (i-1)*cos(theta1) - (j-1)*sin(theta1);
            image(floor(i/Te)+1,floor(j/Te)+1) = ( amplitude * cos(2*pi*(f0*in)));
        end
    end
end


