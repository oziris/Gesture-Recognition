function [k] = pca_var_retain(S, r)
%PCA_VAR_RETAIN Find k, the number of components to retain.
%   [k] = pca_var_retain(S, r)
%   S - eigenvalues
%   r - percentage of variance to retain
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

lambda_d = diag(S);
lambda_n = sum(lambda_d);

k = 0;
while sum(lambda_d(1:k))/lambda_n < r
    k = k + 1;
end

fprintf('For %3.2f%% of variance to retain we need k = %d principal components.\n', r*100, k);

end %function pca_var_retain
