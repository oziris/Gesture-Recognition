function show_subj_hist(s, X, y, ~, numAct, numRec)
%SHOW_SUBJ_HIST Show the histograms for a subject s.
%
%   show_subj_hist(s, X, y, numSubj, numAct, numRec)
%   
%   s - selected subject
%   X - histograms [m x clusters]
%   y - labels
%   numSubj - number of subjects performing an action
%   numAct  - number of actions performed 
%   numRec  - number of recordings per action
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%[set_size, hist_size] = size(X);
[~, hist_size] = size(X);

m = numAct/4;
n = numRec;

subj = s*numAct*numRec;
idx = subj;
k = m*n;

figure(1); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d', s, y(idx)); title(str);
    %fprintf('i=%d , idx=%d\n',i,idx);
end

figure(2); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d', s, y(idx)); title(str);
end

figure(3); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d', s, y(idx)); title(str);
end

figure(4); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d', s, y(idx)); title(str);
end

end %function show_subj_hist

