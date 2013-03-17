function [M] = compare_hist_3d_all(X, measure)
%COMPARE_HIST_3D Compare intraclass for all i,j: h(i) & h(j).
%
% [M] = compare_hist_3d_all(X, measure)
%
%   X - [m x n], m normalized histograms 
%   dist_name: 'l2', 'chi2', 'hell', 'intersect'
% 
%   Eg.: M = compare_hist_3d_all(X, 'l2');
%        plot_comparison_3d(M)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

m = size(X,1);

M = zeros(m,m);

for i=1:m
    for j=i:m
        M(i,j) = histogram_distance(X(i,:), X(j,:), measure);
        if( i ~= j)
            M(j,i) = M(i,j);
        end
    end
end

end %function compare_hist_3d_all
