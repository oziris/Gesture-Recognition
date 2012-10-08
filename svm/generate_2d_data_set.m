function [X, y] = generate_2d_data_set(k)
%GENERATE_2D_DATA_SET Generate dataset with 3 classes, distanced by k.
%
% [X, y] = generate_2d_data_set(k)
%
%   k - distance 
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

X = [randn(1000,2)+[zeros(1000,1), k*ones(1000,1)];...
     randn(1000,2)-[k*cos(pi/6)*ones(1000,1), k*sin(pi/6)*ones(1000,1)];...
     randn(1000,2)+[k*cos(pi/6)*ones(1000,1),-k*sin(pi/6)*ones(1000,1)]];
    
y = [ones(1000,1) ; 2*ones(1000,1) ; 3*ones(1000,1)];
    
figure('color','w');
clf;
hold on
plot(X(1:1000,1),X(1:1000,2),'r.','MarkerSize',12)
plot(X(1001:2000,1),X(1001:2000,2),'b.','MarkerSize',12)
plot(X(2001:3000,1),X(2001:3000,2),'g.','MarkerSize',12)
hold off
 
legend('Cluster 1','Cluster 2','Cluster 3',...
       'Location','NorthWest')  
              
end %function generateDataSet

