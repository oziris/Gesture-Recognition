function [U, S] = pca_compute(X)
%PCA_COMPUTE Run principal component analysis on the dataset X
%
%   [U, S] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

[m, ~] = size(X);

Sigma = (1/m)*(X'*X);

%[U,S,V] = svd(Sigma);
[U,S,~] = svd(Sigma);

end %function pca_compute
