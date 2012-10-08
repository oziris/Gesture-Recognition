function show_hist(X, y, n_bins)
%SHOTHIST Show some histograms.
%   First figure: 20 randomly selected histograms
%   Second figure: first 20 histograms
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

[m n] = size(X);

if nargin < 3
    n_bins = n;
end

idx = randperm(m);

figure(1); clf;

for i=1:20
    subplot(4,5,i);
    bar(1:n_bins,X(idx(i),:),'b');
    set(gca,'xlim',[1 n_bins]);
    str = sprintf('Histogram - k = %d',y(idx(i))); title(str);
end

figure(2); clf;

for i=1:20
    subplot(4,5,i);
    bar(1:n_bins,X(i,:),'b');
    set(gca,'xlim',[1 n_bins]);
    str = sprintf('Histogram - k = %d',y(i)); title(str);
end

end %function show_hist

