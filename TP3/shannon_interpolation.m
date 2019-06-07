function [ imr ] = shannon_interpolation ( ime , taille , Te)

A = zeros(size(ime,1),taille);
for j=1:size(ime,1)
    for i=1:taille
        A(j,i) = cardinal_sine(pi*( (i-1)/Te - (j-1)) );
        %A(j,i) = sinc(( (i-1)/Te - (j-1)) );
    end
end


B = A';


imr = B * ime * A;


end