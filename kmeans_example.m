function kmeans_example()
%KMEANS_EXAMPLE 
%   
% matlab/octave example of kmeans clustering
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

X = [randn(1000,2)+ones(1000,2);...
     randn(1000,2)-ones(1000,2)];

if exist('OCTAVE_VERSION','var')
	% matlab
    opts = statset('Display','iter');

    tic;
    [idx, ctrs] = kmeans(X, 2, 'Distance','sqEuclidean', 'Options',opts);
    toc         
else
    % octave
    [idx, ctrs] = kmeans(X, 2);
end

figure; clf;
hold on;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(ctrs(:,1),ctrs(:,2),'kx', 'MarkerSize',12,'LineWidth',2)
plot(ctrs(:,1),ctrs(:,2),'ko', 'MarkerSize',12,'LineWidth',2)
legend('Cluster 1','Cluster 2','Centroids', 'Location','NorthWest')  
hold off;
   
%size(X)
%size(idx)
%size(ctrs)
fprintf('\n\n');

end %function kmeans_example