function d = l2_distance(h1, h2)
%L2_DISTANCE
%
% d = l2_distance(h1, h2)
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

d = sqrt( sum( (h1-h2).^2 ) ) ;
    
end %function l2_distance
