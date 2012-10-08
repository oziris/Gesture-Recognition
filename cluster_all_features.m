function [C, IDX] = cluster_all_features( X, K, max_iters )
%CLUSTER_ALL_FEATURES K-means without the online faze.
% [C, IDX] = cluster_all_features( X, K, max_iters )
%   X         - m x n 
%   K         - number of cluster centers
%   max_iters - Maximum number of iterations allowed. Default is 100.
%               (Only matlab)        
%   C         - K cluster centroid locations in K x n matrix C.
%   IDX       - m x 1 vector IDX containing the cluster indices of each 
%               feature vector.
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

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
    opts = statset('Display','iter');

    tic;
    [IDX, C] = kmeans(X, K, 'Distance','sqEuclidean',...
                            'onlinephase','off',...
                            'Options',opts);
    toc 
    fprintf('\nDone!\n');
end

end %function cluster_all_features
