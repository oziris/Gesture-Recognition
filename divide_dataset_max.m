function [ TRAIN, TEST ] = divide_dataset_max( FEATURES, k, max )
%DIVIDE_DATASET Divide dataset on the train and test set with 
% maximum number of frames set to max.
%   
% [ TRAIN, TEST ] = divide_dataset_max( FEATURES, k, max )
%
%   FEATURES - dataset
%   k   - first k subjects are in the train set 
%         (N-k) subjects are in the test set
%   max - maximum number of frames
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

numSubj = size(FEATURES.subj,2);
numAct  = size(FEATURES.subj(1).act,2);
numRec  = size(FEATURES.subj(1).act(1).rec,2);

tic;

% create train set
for s=1:k
    for a=1:numAct
        for r=1:numRec
            tmp_max = min(max, size(FEATURES.subj(s).act(a).rec(r).F, 1));

            % fprintf('[ %2d/%2d/%2d ] ', s, a, r);
            TRAIN.subj(s).act(a).rec(r).F(1:tmp_max,:) = ...
                            FEATURES.subj(s).act(a).rec(r).F(1:tmp_max,:);

        end
        %fprintf('\n');
    end
    %fprintf('\n');
end


if k < numSubj
    % create test set
    idx = 0;
    for s=k+1:numSubj
        idx = idx + 1;
        for a=1:numAct
            for r=1:numRec
                tmp_max = min(max, size(FEATURES.subj(s).act(a).rec(r).F, 1));

                % fprintf('[ %2d/%2d/%2d ] ', s, a, r);
                TEST.subj(idx).act(a).rec(r).F(1:tmp_max,:) = ...
                                FEATURES.subj(s).act(a).rec(r).F(1:tmp_max,:);

            end
            %fprintf('\n');
        end
        %fprintf('\n');
    end

else
    TEST = [];
end %if - no test part if k = #subjects

toc

end %function divide_dataset_max