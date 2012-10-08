function check_normalized_histogram()
%CHECK_NORMALIZED_HISTOGRAM Sanity check for get_normalized_histogram fun.
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

I = imread('phone2.jpg');
I = I(:);
%====================================
bins = 256 ;
tic
N = histc(I,1:bins);
h1 = N ./ sum(N);
toc
figure(1); clf;
bar(h1);
set(gca,'xlim',[1 bins]);
%====================================
I = double(I);
tic
h2 = get_normalized_histogram(I,(1:bins)');
toc
figure(2); clf;
bar(h2)
set(gca,'xlim',[1 bins]);
%====================================
v = randperm(bins);

for i=1:20
    fprintf('h1(%3d) = %1.5f, h2(%3d) = %1.5f, Eps = %f\n', ...
            v(i), h1(v(i)), v(i), h2(v(i)), abs(h1(v(i))-h2(v(i))));
end

%====================================
end %function check_normalized_histogram