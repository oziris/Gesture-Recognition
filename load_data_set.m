function [DATASET] = load_data_set(path)
%LOAD_DATA_SET Load data set.
%
% [DATASET] = load_data_set(path, num, pos_data, pos_conf, ori_data, ori_conf)
%
%   path - path to the dataset 
%
%   DATASET: struct for the data set
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

    subjs = {'subj01', 'subj02', 'subj03', 'subj04', 'subj05', 'subj06', ...
             'subj07', 'subj08', 'subj09', 'subj10', 'subj11', 'subj12', ...
             'subj13', 'subj14', 'subj15', 'subj16'};
    acts = {'balance', 'climbladder', 'climbup', 'duck', 'hop', 'kick', ...
               'leap', 'punch', 'run', 'stepback', 'stepfront', 'stepleft', ...
               'stepright', 'twistleft', 'twistright', 'vault'};

    subjects = 16;  % 16
    actions = 16;   % 16
    repeats = 5;    %  5
    
    % loadSkeleton('~/workspace/rahul/dg1public/subj01/stepleft.4.ske');
    fprintf('Loading data... \n');
    
    for s = 1:subjects
        fprintf('\t %s: \n',char(subjs(s)));
        for a = 1:actions
            fprintf('\t\t %s: \n',char(acts(a)));
            fprintf('\t\t\t ');
            for r = 1:repeats
                fprintf(' %d',r);
                file = strcat(path, subjs(s), '/', acts(a), '.', num2str(r), '.ske');
                [ posMat, posConf, oriMat, oriConf ] = load_skeleton(char(file));
                
                %NUMFRAMES(s,a,r) = size(posMat,1);
                %DATASET(s,a,r,1:size(posMat,1),:,:) = posMat(:,1,:,:);

                DATASET.subj(s).act(a).rec(r).numFrames = size(posMat,1);
                DATASET.subj(s).act(a).rec(r).posMat(1:size(posMat,1),:,:) = posMat(:,1,:,:);
                DATASET.subj(s).act(a).rec(r).posConf(1:size(posConf,1),:,:) = posConf(:,1,:,:);
                DATASET.subj(s).act(a).rec(r).oriMat(1:size(oriMat,1),:,:) = oriMat(:,1,:,:);
                DATASET.subj(s).act(a).rec(r).oriConf(1:size(oriConf,1),:,:) = oriConf(:,1,:,:);
            end
            fprintf('\n');
        end
    end
    fprintf('\nDone!\n');
end %function load_data_set 
