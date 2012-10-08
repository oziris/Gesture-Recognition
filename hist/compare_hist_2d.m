function [d] = compare_hist_2d( X, y, action, idx, measure)
%COMPARE_HIST_2D Compare h(idx) to all the rest h(i).
%
% [d] = compare_hist_2d(X, y, action, idx, measure)
%
%   X - [m x n], m normalized histograms 
%   dist_name: 'l2', 'chi2', 'hell', 'intersect'
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

X_new = X(y == action,:);

m = size(X_new,1);

d = zeros(1,m);

for i=1:m
    d(i) = histogram_distance(X_new(idx,:), X_new(i,:), measure);
end

end %function compare_hist

