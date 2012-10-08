function [Z] = pca_project(X, U, k)
%PCA_PROJECT Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%
%   Z = projectData(X, U, k) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first k columns of U. It returns the projected examples in Z.
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

Z = (U(:,1:k)'*X')';

end %function pca_project
