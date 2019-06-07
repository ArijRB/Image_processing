function [ J ] = subSampling2( I )

[n,m] = size(I);

n1 = floor(n/2);
m1 = floor(m/2);

J = zeros(n1,m1);

for i=1:n1
   for j=1:m1
       J(i,j) = I(2*i,2*j);
   end
end




end

