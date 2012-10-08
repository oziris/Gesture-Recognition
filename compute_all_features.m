function [FEATURES] = compute_all_features(DATASET, normalize, param)
%COMPUTE_ALL_FEATURES 
% 
% [FEATURES] = compute_all_features(DATASET, normalize, param)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

numSubj = size(DATASET.subj,2);
numAct  = size(DATASET.subj(1).act,2);
numRec  = size(DATASET.subj(1).act(1).rec,2);

fprintf('\n[ subject / action / recording ] \n\n');

tic;
for s=1:numSubj
    for a=1:numAct
        for r=1:numRec
            fprintf('[ %2d/%2d/%2d ] ', s, a, r);
            FEATURES.subj(s).act(a).rec(r).F = ...
              compute_features( DATASET.subj(s).act(a).rec(r).posMat, normalize, param );
        end
        fprintf('\n');
    end
    fprintf('\n');
end
toc
    
end %function compute_all_features

