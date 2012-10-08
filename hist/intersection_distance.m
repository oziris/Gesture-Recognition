function d = intersection_distance(h1, h2)
%INTERSECTION_DISTANCE
%
% d = intersection_distance(h1, h2)
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com
    
d = 1 - sum( min (h1,h2) ) ;

end %function intersection_distance
