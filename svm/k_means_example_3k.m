function [X, idx, ctrs] = k_means_example_3k(k)
%K_MEANS_EXAMPLE_3K
%
% [X, idx, ctrs] = k_means_example_3k(k)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

X = [randn(1000,2)+[zeros(1000,1), k*ones(1000,1)];...
     randn(1000,2)-[k*cos(pi/6)*ones(1000,1), k*sin(pi/6)*ones(1000,1)];...
     randn(1000,2)+[k*cos(pi/6)*ones(1000,1),-k*sin(pi/6)*ones(1000,1)]];

tic;
[idx,ctrs] = kmeans(X, 3, 'Distance','city', 'Replicates', 5);
toc          

figure; clf; hold on;

plot(X(idx==1,1), X(idx==1,2), 'r.', 'MarkerSize', 5)
plot(X(idx==2,1), X(idx==2,2), 'b.', 'MarkerSize', 5)
plot(X(idx==3,1), X(idx==3,2), 'g.', 'MarkerSize', 5)

plot(ctrs(:,1), ctrs(:,2), 'kx', 'MarkerSize', 10, 'LineWidth', 2)
 
legend('Cluster 1','Cluster 2','Cluster 3','Centroids', 'Location','NorthEast')  
              
%size(X)
%size(idx)
%size(ctrs)

end %function k_means_example_3k

