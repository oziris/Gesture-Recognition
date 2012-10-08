function [h] = get_normalized_histogram(F,C)
%GET_NORMALIZED_HISTOGRAM
%   [h] = get_normalized_histogram(F,C)
%   F - k x n matrix, where k is the size of the bag 
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

h = zeros(1,size(C,1));
%[frames n] = size(F);
frames = size(F,1);
for i=1:frames
    [ ~ , idx ] = min(sum(bsxfun(@minus, C, F(i,:)).^2,2));
    h(idx) = h(idx) + 1;
end
h = h ./ frames ;

end %function get_normalized_histogram