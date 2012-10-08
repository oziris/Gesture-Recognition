function  plot_comparison_2d( d )
%PLOT_COMPARISON_2D
%
% plot_comparison_2d(d)
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

figure; clf; 
m = length(d);

h = plot(d);

grid on;
set(gca,'XTick', 0:5:m);
set(gca,'YTick', 0:0.1:1);

end %function plot_comprison 

