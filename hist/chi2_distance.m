function d = chi2_distance(h1, h2)
%CHI2_DISTANCE
%
% d = chi2_distance(h1, h2)
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

d = 0.5 * sum( ((h1-h2).^2)  ./ (h1+h2+1e-10) ) ;

end %function
