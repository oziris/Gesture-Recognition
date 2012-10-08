function [generic] = generic_skeleton( DATASET )
%GENERIC_SKELETON The generic skeleton is computed by averaging the 
%   skeleton in the first frame of the training set.
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

tic;

numSubj = size(DATASET.subj,2);
numAct  = size(DATASET.subj(1).act,2);
numRec  = size(DATASET.subj(1).act(1).rec,2);

generic = zeros(15, 3);
tmp = zeros(15, 3); 

for s=1:numSubj
    for a=1:numAct
        for r=1:numRec
            tmp(:,:) = DATASET.subj(s).act(a).rec(r).posMat(1,:,:);
            generic = generic + tmp;
        end
    end
end

generic = generic ./ (numSubj * numAct * numRec);

toc

end %function generic_skeleton
