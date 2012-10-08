function [ trans ] = transform_f( FEATURES )
%TRANSFORM_F Transform/reformat - unroll BoW.
% [ trans ] = transform_f( FEATURES )
%   FEATURES - format: FEATURES.subj(s).act(a).rec(r).F 
%                      F = k x n, where k can vary in size                              
%   F_trans  - format: m x n, m is count_number_of_features( FEATURES )
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

fprintf('Reformatting features.\n');
tic
numSubj = size(FEATURES.subj,2);
numAct  = size(FEATURES.subj(1).act,2);
numRec  = size(FEATURES.subj(1).act(1).rec,2);

% number of all feature vectors
count = count_number_of_features( FEATURES );

trans = zeros(count,555);

idx = 1;
for i=1:numSubj
    for j=1:numAct
        for k=1:numRec
            num=size(FEATURES.subj(i).act(j).rec(k).F,1);
%             for f=1:size(FEATURES.subj(i).act(j).rec(k).F,1)
%                 trans(idx,:) = FEATURES.subj(i).act(j).rec(k).F(f,:);
%                 idx = idx + 1;
%             end
            trans(idx:idx+num-1,:) = FEATURES.subj(i).act(j).rec(k).F;
            idx = idx + num;
        end
    end
end
toc
fprintf('Done!\n\n');

end %function transform_f

