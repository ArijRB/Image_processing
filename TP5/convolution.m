function [J] = convolution(I,h)
% produit de convolution discret 2d entre I et h
% h : symétrique de la réponse impulsionnelle du filtre

I = double(I);

% 0 : zero-padding
% 1 : padding miroir
% 2 : padding p�riodique
typePadding=1;


t = (size (h,1)-1)/2;
Ip = zeros( (size (I,1)+2*t) ,(size (I,2)+2*t ) ) ;

for i=1+t:(size (I,1)+t)
    for j=1+t:(size (I,2)+t)
        Ip(i,j) = I(i-t,j-t);
    end
end

if(typePadding==1)
    % 1 pading miroir
    for i=1:t
        Ip(i,:) = Ip(t+1,:);
    end
    for i=(size (I,1)+t+1):size (Ip,1)
        Ip(i,:) = Ip((size (I,1)+t),:);
    end
    for j=1:t
        Ip(:,j) = Ip(:,t+1);
    end
    for j=(size (I,2)+t+1):size (Ip,2)
        Ip(:,j) = Ip(:,(size (I,2)+t));
    end
end
     
[l,c] = size(I);
J = zeros(size(I));

 
for i=1+t:(l+t)
    for j=1+t:(c+t)
        for k=-t:t
            for l=-t:t
                J(i-t,j-t) =  J(i-t,j-t) + Ip(i+k,j+l)*h(k+t+1,l+t+1);
            end
        end  
        
    end
end



end