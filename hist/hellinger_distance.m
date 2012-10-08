function d = hellinger_distance(h1, h2)
%HELLINGER_DISTANCE
% 
% d = hellinger_distance(h1, h2)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

d = sqrt(0.5 * sum( (sqrt(h1) - sqrt(h2)).^2 ) ) ;

end %function hellinger_distance
