function [ svm_model, predicted_label, accuracy, decision_values ] = train_svm( X , y )
%TRAIN_SVM Train SVM model(s).
% [ svm_model, predicted_label, accuracy, decision_values ] = train_svm( X , y )
%   X - data set
%   y - labels
% 
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%########################################################################## 
% Shuffle data set
%{
v = randperm(size(X,1))';
X = X(v,:); y = y(v);
%}

%########################################################################## 
[m n] = size(X);

train_data = X(1:m/2,:);
train_label = y(1:m/2,:);

test_data = X(m/2+1:end,:);
test_label = y(m/2+1:end,:);

%{
train_data = X(1:400,:);
train_label = y(1:400,:);

test_data = X(401:end,:);
test_label = y(401:end,:);
%}

%{
train_data = X(1:1040,:);
train_label = y(1:1040,:);

test_data = X(1041:end,:);
test_label = y(1041:end,:);
%}
%########################################################################## 
fprintf('\nTrain linear SVM:\n');
% SVM train
[ svm_model, data_trans ] = train_linear(train_data, train_label);

fprintf('\nPredict linear SVM:\n');
% SVM predict
[predicted_label, accuracy, decision_values] = test_linear( ... 
                            test_data, test_label, svm_model, data_trans );

fprintf(' Accuracy = %3.2f%%\n\n',accuracy(1));

%########################################################################## 
fprintf('\nTrain histogram intersection SVM:\n');
% SVM train
[ svm_model, data_trans ] = train_hist( train_data, train_label );

% SVM predict
fprintf('\nPredict histogram intersection SVM:\n');
[predicted_label, accuracy, decision_values] = test_hist( ... 
                            test_data, test_label, svm_model, data_trans  );

fprintf(' Accuracy = %3.2f%%\n\n',accuracy(1));

%########################################################################## 
end %function train_svm