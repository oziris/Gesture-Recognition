function demo_linear_8_classes()
%DEMO_LINEAR_8_CLASSES SVM - linear kernel example.
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%##########################################################################
% Generate data set
[X, y] = generate_3d_data_set(2);

% Shuffle data set
v = randperm(size(X,1))';
X = X(v,:); y = y(v);

%########################################################################## 
[m n] = size(X);

train_data = X(1:m/2,:);
train_label = y(1:m/2,:);

test_data = X(m/2+1:end,:);
test_label = y(m/2+1:end,:);

%########################################################################## 
% LIBSVM path
%addpath libsvm

fprintf('\nTrain linear SVM:\n');
% SVM train
[ svm_model, data_trans ] = train_linear(train_data, train_label);

fprintf('\nPredict linear SVM:\n');
% SVM predict
[predicted_label, accuracy, decision_values] = test_linear( ... 
                            test_data, test_label, svm_model, data_trans );

fprintf(' Accuracy = %3.2f%%\n\n',accuracy(1));
% clean up
%rmpath libsvm
%########################################################################## 
end %functon demo_linear_8_class
