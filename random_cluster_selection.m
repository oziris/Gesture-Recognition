function [C] = random_cluster_selection(X, c_num)
%RANDOM_CLUSTER_SELECTION Select random clusters from all features.
%
% [C] = random_cluster_selection(FEATURES, c_num) 
%   X     - feature data set (m x n)
%   c_num - number of clusters
%   C     - random clusters (c_num x n)
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%##########################################################################

fprintf('Selecting random cluster centers.\n');

% a vector containing a random permutation of the integers 1:count
%v = randperm(count);
v = randperm(size(X,1));

C = zeros(c_num,555);

C(1:c_num,:) = X(v(1:c_num), :);

fprintf('Done!\n\n');

%##########################################################################

end %function random_cluster_selection
