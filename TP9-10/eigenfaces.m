function[U,lambdas]=eigenfaces(Xc)
[U,S,V] = svd(Xc,0);
lambdas = diag(S).^2;
end