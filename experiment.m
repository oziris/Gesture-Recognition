%% Measuring and Reducing Observational Latency when Recognizing Actions
% 
%   Implementation of the base line method 
%
%   Original authors:
%       Syed Z. Masood
%       Chris Ellis 
%       Adarsh Nagaraja
%       Marshall F. Tappen
%       Joseph J. LaViola Jr.
%       Rahul Sukthankar
% 
%   2011: http://www.cs.ucf.edu/~smasood/publications/ICCV2011_LatencyReduction.pdf
%   2012: http://www.cs.ucf.edu/~smasood/publications/IJCV2012_LatencyReduction.pdf
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%%=========================================================================
%% PATH SETUP
addpath( pwd )
addpath([ pwd '/hist']);
addpath([ pwd '/libsvmhist']);
addpath([ pwd '/svm']);

% path to the dataset folder
DATA_PATH = '~/workspace/rahul/dg1public/';
%%=========================================================================
%% LOAD DATASET
fprintf('\n===========================================================\n');
fprintf('Load dataset\n');

if exist([ DATA_PATH 'DATASET.mat'],'file')
    load([ DATA_PATH 'DATASET.mat']);
else
    DATASET = load_data_set(data_path);
end    

if(~exist('DATASET','var'))
    error('Data set not loaded!');
end    

% Size of the data set:
%   * number of subjects
%   * number of actions
%   * number of records per action
%
% numSubj = size(DATASET.subj,2);
% numAct  = size(DATASET.subj(1).act,2);
% numRec  = size(DATASET.subj(1).act(1).rec,2);

% Animate the whole dataset:
% check_data_set( DATASET )

%fprintf('Program paused. Press enter to continue.\n');
%pause;
%%=========================================================================
%% COMPUTE FEATURES
fprintf('\n===========================================================\n');
fprintf('Compute features\n');

% Hand check:
% check_compute_features(1)

if exist([ DATA_PATH 'FEATURES.mat' ],'file')
    load([ DATA_PATH 'FEATURES.mat' ]);
else
    [FEATURES] = compute_all_features( DATASET, 'no', 'iccv' );
end
    
if(~exist('FEATURES','var'))
    error('Features not computed!');
end 

%fprintf('Program paused. Press enter to continue.\n');
%pause;
%%=========================================================================
%% DIVIDE DATASET -> TRAIN, TEST
fprintf('\n===========================================================\n');
fprintf('Divide dataset: train/test\n');

%[ TRAIN, TEST ] = divide_dataset_max( FEATURES, k, max )
%    k   - # of train examples
%  (N-k) - # of test examples
%   max  - # of "frames" to be considered (feature vectors) 

[ TRAIN, TEST ] = divide_dataset_max( FEATURES, 10, 30);
%[ TRAIN, ~ ] = divide_dataset_max( FEATURES, 16, 30);

%fprintf('Program paused. Press enter to continue.\n');
%pause;
%%=========================================================================
%% TRANSFROM DATASET
fprintf('\n===========================================================\n');
fprintf('Cluster-based quantization\n');

% reduce data set size by selecting a subset of actions
%[F_sub, T_table] = get_sub_set( FEATURES, [4 5 10 11 12 13 2 1] );

% reformat features
[ train ] = transform_f( TRAIN );


%fprintf('Program paused. Press enter to continue.\n');
%pause;
%%=========================================================================
%% PCA
% fprintf('\n===========================================================\n');
% fprintf('PCA\n');
%{ 
[train_norm, mu, sigma] = feature_normalize(train);

[U, S] = pca_compute(train_norm);

r = 0.95;

[k] = pca_var_retain(S, r);

[Z] = pca_project(train_norm, U, k);
%}
% fprintf('Program paused. Press enter to continue.\n');
% pause;
%%=========================================================================
%% CLUSTER-BASED QUANTIZATION
fprintf('\n===========================================================\n');
fprintf('Cluster-based quantization\n');

% Number of clusters
K = 1000; 

% Use random cluster selection
% [C] = random_cluster_selection(F_trans, K);
% [X, y] = compute_histograms(F_trans, C);


% K-means clustering
max_iters = 100;
[C, IDX] = cluster_all_features( train, K, max_iters );
[ X, y ] = compute_histograms(TRAIN, C, IDX);


% Piotr's Image & Video Matlab Toolbox
% http://vision.ucsd.edu/~pdollar/toolbox/doc/
%
%prm.display = 1
%[ IDX, C, d ] = kmeans2( train, K, prm);
%[ X, y ] = compute_histograms(TRAIN, C, IDX);

%fprintf('Program paused. Press enter to continue.\n');
%pause;
%%=========================================================================
%% SVM
fprintf('\n===========================================================\n');
fprintf('SVM\n');

[svm_model, predicted_label, accuracy, decision_values ] = train_svm(X, y);

fprintf('\n===========================================================\n');

%%=========================================================================