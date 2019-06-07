function [ id_test_hat ] = identification( D )
[p, id_test_hat] = min(D'); 
end