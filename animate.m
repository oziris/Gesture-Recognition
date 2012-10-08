function [ M ] = animate( posMat )
%ANIMATE Animate captured skeleton data.
%
% [ M ] = animate( posMat )
%   posMat - sequence of captured skeleton points
%   
%   Eg. M = animate(DATASET.subj(1).act(16).rec(1).posMat);
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

min_x =  inf; 
max_x = -inf;
min_y =  inf; 
max_y = -inf;
min_z =  inf; 
max_z = -inf;
x=1; y=2; z=3;

for k=1:size(posMat,1)
    %=============================
    tmp = min(posMat(k,:,x));
    if(tmp < min_x) 
        min_x = tmp;
    end
    tmp = max(posMat(k,:,x));
    if(tmp > max_x) 
        max_x = tmp;
    end 
    %=============================
    tmp = min(posMat(k,:,y));
    if(tmp < min_y) 
        min_y = tmp;
    end
    tmp = max(posMat(k,:,y));
    if(tmp > max_y) 
        max_y = tmp;
    end 
    %=============================
    tmp = min(posMat(k,:,z));
    if(tmp < min_z) 
        min_z = tmp;
    end
    tmp = max(posMat(k,:,z));
    if(tmp > max_z) 
        max_z = tmp;
    end 
    %=============================
end

%{
fprintf('min_x = %g, max_x = %g\n', min_x, max_x)
fprintf('min_y = %g, max_y = %g\n', min_y, max_y)
fprintf('min_z = %g, max_z = %g\n', min_z, max_z)
%}

for k=1:size(posMat,1)
    %plotSkeleton(posMat(k,:,:));
    plot_skeleton( posMat(k,:,:), min_x, max_x, min_z, max_z, min_y, max_y )
    M(k) = getframe;
end

end %function animate