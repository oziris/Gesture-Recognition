function show_act_hist(a, X, y, ~, numAct, numRec)
%SHOW_ACT_HIST Show the histograms for an action a.
%   
%   show_act_hist(a, X, y, numSubj, numAct, numRec)
%   
%   a - selected action
%   X - histograms [m x clusters]
%   y - labels
%   numSubj - number of subjects performing an action
%   numAct  - number of actions performed 
%   numRec  - number of recordings per action
%
%   Eg.: show_act_hist(5, X, y, 16, 16, 5)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%[set_size, hist_size] = size(X);
[~, hist_size] = size(X);

m = numAct/4;
n = numRec;

act = (numAct-1) * numRec;
idx = (a-1)*numRec;
sdx = 1;
k = m*n;

figure(1); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d',sdx,y(idx)); title(str);
    %fprintf('i=%d , idx=%d\n',i,idx);   
    if(mod(idx,5) == 0)
        idx = idx + act;
        sdx = sdx + 1;
    end
end

figure(2); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d',sdx,y(idx)); title(str);
    %fprintf('i=%d , idx=%d\n',i,idx);   
    if(mod(idx,5) == 0)
        idx = idx + act;
        sdx = sdx + 1;
    end
end

figure(3); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d',sdx,y(idx)); title(str);
    %fprintf('i=%d , idx=%d\n',i,idx);   
    if(mod(idx,5) == 0)
        idx = idx + act;
        sdx = sdx + 1;
    end
end

figure(4); clf;
for i=1:k
    idx = idx+1;
    subplot(m,n,i);
    bar(1:hist_size,X(idx,:),'b');
    set(gca,'xlim',[1 hist_size]);
    str = sprintf('Histogram - s = %d, a = %d',sdx,y(idx)); title(str);
    %fprintf('i=%d , idx=%d\n',i,idx);   
    if(mod(idx,5) == 0)
        idx = idx + act;
        sdx = sdx + 1;
    end
end

end %function show_act_hist
