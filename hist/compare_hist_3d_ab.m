function [M] = compare_hist_3d_ab(X, y, action1, action2, measure)
%COMPARE_HIST_3D_AB
%
% [M] = compare_hist_3d_ab(X, y, action1, action2, measure)
%
%   X - [m x n], m normalized histograms 
%   action1 - action A
%   action2 - action B
%
%   dist_name: 'l2', 'chi2', 'hell', 'intersect'
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

X1 = X(y == action1,:);
X2 = X(y == action2,:);

m = size(X1,1);

M = zeros(m,m);

for i=1:m
    for j=1:m
        M(i,j) = histogram_distance(X1(i,:), X2(j,:), measure);
    end
end

end %function compare_hist

