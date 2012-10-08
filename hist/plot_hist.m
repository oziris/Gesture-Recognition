function plot_hist(h)
%PLOT_HIST
%
% plot_hist(h)
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

figure; clf;
[m n] = size(h);
if exist('OCTAVE_VERSION')
	% octave
	bar(1:n,h,'facecolor','b');
else
	% matlab
	bar(1:n,h,'b');
end
set(gca,'xlim',[1 n]);
str = sprintf('Histogram'); title(str);
    
end %function plot_hist
