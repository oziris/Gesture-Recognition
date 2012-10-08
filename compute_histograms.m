function [ X, y ] = compute_histograms(FEATURES, C, IDX)
%COMPUTE_HISTOGRAMS Compute histograms from feature vectors.
%
% [ X, y ] = COMPUTE_HISTOGRAMS(FEATURES, C, IDX)
%
%   FEATURES - struct [subj(s).act(a).rec(r).F] 
%   C        - cluster centers [k x n]
%   IDX      - cluster indices of each feature vector [m x 1]
%
%   X - data set (BoW - histograms) [m x k]
%   y - labels [m x 1]
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%##########################################################################
fprintf('Computing histograms.\n');
tic;
numSubj = size(FEATURES.subj,2);
numAct  = size(FEATURES.subj(1).act,2);
numRec  = size(FEATURES.subj(1).act(1).rec,2);

m = numSubj*numAct*numRec;

% Histogram size = number of clusers K
%[hist_size, feature_size] = size(C);
[hist_size, ~ ] = size(C);
 
X = zeros(m,hist_size);
y = zeros(m,1);

%##########################################################################
% If random cluster selection, we need to compute the histograms, since 
% there are no cluster indices.
if (isempty(IDX))
    l = 1;
    for s=1:numSubj
        for a=1:numAct
            for r=1:numRec
                X(l,:) = get_normalized_histogram(FEATURES.subj(s).act(a).rec(r).F,C);
                y(l) = a;
                fprintf('%4d/%4d ',l,m);
                l = l+1;
            end
            fprintf('\n');
        end
        fprintf('\n');
    end
%##########################################################################
else % IDX computed with k-Means
%########################################################################## 
% We have cluster indices of each feature vector. Only need to count how
% many there are.
    l = 1; % current histogram
    f = 1; % current index into IDX [m x 1]; need only the feature vectors 
           % of current subj/act/rec 
    for s=1:numSubj
        for a=1:numAct
            for r=1:numRec
                % size of the current subj/act/rec feature vector set
                f_num = size(FEATURES.subj(s).act(a).rec(r).F,1);
                % indices for current feature vector set 
                f_idx = IDX(f:f+f_num-1)';
                % single histogram 
                f_hist = zeros(1,hist_size);
                % 'compute' histogram
                for i=1:hist_size
                    f_hist(i) = sum(f_idx == i);
                end
                % normalize histogram
                X(l,:) = f_hist ./ sum(f_hist);
                % set current action label
                y(l) = a;
                fprintf('%4d/%4d ',l,m);
                % next histogram
                l = l+1;
                % next index
                f = f + f_num;
            end
            fprintf('\n');
        end
        fprintf('\n');
    end
    
end %if
%##########################################################################   
toc
fprintf('Done!\n\n');
end %function compute_histograms