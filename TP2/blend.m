function [I3] = blend(I1,I2,alpha)
[N,M] = size(I1);
I3 = zeros(N,M);
I1 = double(I1);
I2 = double(I2);

for i=1:N
    for j=1:M
        I3(i,j) = alpha*I1(i,j) + (1-alpha)*I2(i,j);
    end
end

end

