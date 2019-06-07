function h = gauss( sigma )

N = 2*ceil(3*sigma) +1;
h = zeros(N,N);

N2 = ceil(N/2);

for i=1:N
    for j=1:N
    h(i,j) = 1/(2*pi*sigma*sigma) * exp (-( (i-N2) * (i-N2) + (j-N2) * (j-N2))/(2*sigma*sigma)  );
    end
end

end
