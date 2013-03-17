function [C, IDX] = cluster_all_features(X, K, max_iters, empty_action)
%CLUSTER_ALL_FEATURES K-means without the online faze.
% [C, IDX] = cluster_all_features(X, K, max_iters, empty_action)
%   X         - m x n, m = #of examples,  n = #of features 
%   K         - number of cluster centers
%
%   Only matlab:
%   max_iters - Maximum number of iterations allowed. Default is 100.
%   empty_action - Action to take if a cluster loses all its member 
%                  observations. Default is 'singleton'.
%
%   C         - K cluster centroid locations in K x n matrix C.
%   IDX       - m x 1 vector IDX containing the cluster indices of each 
%               feature vector.
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

if nargin < 3
    max_iters = 100;
    empty_action = 'singleton';
end

if nargin < 4
    empty_action = 'singleton';
end

if exist('OCTAVE_VERSION','var')
	% octave: http://octave.sourceforge.net/statistics/overview.html
    fprintf('K-means clustering: K = %d\n\n',K);
    tic;
    [IDX, C] = kmeans(X, 2);
    toc 
    fprintf('\nDone!\n');  
else
    % matlab
    fprintf('K-means clustering: K = %d, max_iters = %d\n\n',K, max_iters);
    
    % statset('kmeans')
    opts = statset('Display', 'iter',...
                   'MaxIter', max_iters);
    
    tic;
    [IDX, C] = kmeans(X, K, 'Distance', 'sqEuclidean',...
                            'onlinephase', 'off',...
                            'emptyaction', empty_action,...
                            'Options', opts);
    toc 
    fprintf('\nDone!\n');
end

end %function cluster_all_features
