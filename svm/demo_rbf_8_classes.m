function demo_rbf_8_classes()
%DEMO_RBF_8_CLASSES SVM - rbf kernel example.
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%##########################################################################
% Generate data set
[ X, y ] = generate_3d_data_set( 2.5 );

% Shuffle data set
v = randperm(size(X,1))';
X = X(v,:); y = y(v);

%########################################################################## 
[m ~] = size(X);

train_data = X(1:m/2,:);
train_label = y(1:m/2,:);

test_data = X(m/2+1:end,:);
test_label = y(m/2+1:end,:);

%########################################################################## 
% LIBSVM path
%addpath libsvm

fprintf('\nTrain rbf SVM:\n');
% SVM train
[ svm_model, data_trans ] = train_rbf(train_data, train_label);

fprintf('\nPredict rbf SVM:\n');
% SVM predict
[predicted_label, accuracy, decision_values] = test_rbf( ... 
                            test_data, test_label, svm_model, data_trans );

fprintf(' Accuracy = %3.2f%%\n\n',accuracy(1));
% clean up
%rmpath libsvm
%########################################################################## 
end %function demo_rbf_8_classes
