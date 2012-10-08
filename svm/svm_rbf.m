function svm_rbf(X, y, c)
%SVM_RBF SVM with radial basis kernel function.
%
% svm_rbf(X, y, c)
%
%   X - data set
%   y - labels
%   c - train/test ratio [0,1]
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%##########################################################################

% Shuffle data set
v = randperm(size(X,1))';
X = X(v,:); y = y(v);

%########################################################################## 
[m n] = size(X);

d = round(m*c);
fprintf('\nTrain set size: %d:\n',d);
fprintf('\nTest set size:  %d:\n',m-d);

train_data = X(1:d,:);
train_label = y(1:d,:);

test_data = X(d+1:end,:);
test_label = y(d+1:end,:);

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
end %function svm_rbf