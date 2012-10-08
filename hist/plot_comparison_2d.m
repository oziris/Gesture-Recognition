function plot_comparison_2d(d1, d2)
%PLOT_COMPARISON_2D
%
% plot_comparison_2d(d1, d2)
%   d2 is optional
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

figure; clf; hold on;
m = length(d1);

plot(d1);

if nargin == 2
    plot(d2, 'r')
end

grid on;
set(gca,'XTick', 0:5:m);
set(gca,'YTick', 0:0.1:1);

end %function plot_comprison 

