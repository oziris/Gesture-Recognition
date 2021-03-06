function [M] = compare_hist_3d(X, y, action, measure)
%COMPARE_HIST_3D Compare intraclass for all i,j: h(i) & h(j).
%
% [M] = compare_hist_3d(X, y, action, measure)
%
%   X - [m x n], m normalized histograms 
%   dist_name: 'l2', 'chi2', 'hell', 'intersect'
% 
%   Eg.: M = compare_hist_3d(X, y, 5, 'l2');
%        plot_comparison_3d(M)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

X_new = X(y == action,:);

m = size(X_new,1);

M = zeros(m,m);

for i=1:m
    for j=i:m
        M(i,j) = histogram_distance(X_new(i,:), X_new(j,:), measure);
        if( i ~= j)
            M(j,i) = M(i,j);
        end
    end
end

end %function compare_hist

