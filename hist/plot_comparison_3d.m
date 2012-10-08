function plot_comparison_3d( M )
%PLOT_COMPARISON_3D - mesh
%
% plot_comparison_3d(M)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

figure; clf; 

[m ~] = size(M);

[X,Y] = meshgrid(1:m);

mesh(X,Y,M);

set(gca,'XTick', 0:5:m);
set(gca,'YTick', 0:5:m);
set(gca,'ZTick', 0:0.1:1);

end %function plot_comprison 
