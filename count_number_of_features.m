function [sum] = count_number_of_features(FEATURES)
%COUNT_NUMBER_OF_FEATURES 
% [ sum ] = count_number_of_features( FEATURES )
%   FEATURES - features (FEATURES.subj(s).act(a).rec(r).F)
%   sum      - sum over all F, where F_i has f_i1 ... f_ik
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com
sum = 0;

for i=1:size(FEATURES.subj,2)
    for j=1:size(FEATURES.subj(1).act,2)
        for k=1:size(FEATURES.subj(1).act(1).rec,2)
            sum = sum + size(FEATURES.subj(i).act(j).rec(k).F,1);
        end
    end
end

end %function count_number_of_features

