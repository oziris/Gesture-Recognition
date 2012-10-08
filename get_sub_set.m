function [F_sub, T_table] = get_sub_set(F,idx)
%GET_SUB_SET fetures subset
%  [F_sub, T_table] = get_sub_set(F,idx)
%   F   - features
%   idx - selected subset features
%   T_table - class translation table
%
%   E.g. idx = [4 5 10 11 12 13 2 1]
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

% F.subj(s).act(a).rec(r)
numSubj = size(F.subj,2);

fprintf('Copying subset... \n');

for s = 1:numSubj
    for k = 1:length(idx)
        a = idx(k);
        F_sub.subj(s).act(k) = F.subj(s).act(a);
    end
end

T_table = [(1:length(idx))', idx'];

fprintf('Done!\n');

end %function get_sub_set
