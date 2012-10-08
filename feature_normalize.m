function [X_norm, mu, sigma] = feature_normalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. 
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);

end %function feature_normalize
