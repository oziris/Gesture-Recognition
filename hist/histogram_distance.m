function d = histogram_distance(h1, h2, dist_name)
%HISTOGRAM_DISTANCE Distance between normalized histograms!
%
% d = histogram_distance(h1, h2, dist_name)
%   
%   h1, h2 - normalized histograms
%   dist_name: 'l2', 'chi2', 'hell', 'intersect'
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

switch dist_name
    case 'l2'
        d = l2_distance( h1, h2 ) ; 
    case 'chi2'
        d = chi2_distance( h1, h2 ) ; 
    case 'hell'
        d = hellinger_distance( h1, h2 ) ;
    case 'intersect'
        d = intersection_distance( h1, h2 ) ; 
    otherwise
        error('Unknown parameter!') ;
end

end %function histogram_distance
