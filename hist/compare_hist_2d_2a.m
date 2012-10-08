function [d1, d2] = compare_hist_2d_2a(X, y, action1, action2, idx, measure)
%COMPARE_HIST_2D Compare h(idx) to all the rest h(i).
%
% [d1, d2] = compare_hist_2d_2a( X, y, action, idx, measure )
%
%   X - [m x n], m normalized histograms 
%   dist_name: 'l2', 'chi2', 'hell', 'intersect'
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

X_new1 = X(y == action1,:);
X_new2 = X(y == action2,:);

m = size(X_new1,1);
d1 = zeros(1,m);

for i=1:m
    d1(i) = histogram_distance(X_new1(idx,:), X_new1(i,:), measure);
end

m = size(X_new2,1);
d2 = zeros(1,m);

for i=1:m
    d2(i) = histogram_distance(X_new1(idx,:), X_new2(i,:), measure);
end

end %function compare_hist_2d_2a

