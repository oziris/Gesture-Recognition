function svm_linear(X, y, c)
%SVM_LINEAR SVM with linear kernel function.
%
% svm_linear(X, y, c)
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

fprintf('\nTrain linear SVM:\n');
% SVM train
[ svm_model, data_trans ] = train_linear(train_data, train_label);

fprintf('\nPredict linear SVM:\n');
% SVM predict
[predicted_label, accuracy, decision_values] = test_linear( ... 
                            test_data, test_label, svm_model, data_trans );

fprintf(' Accuracy = %3.2f%%\n\n',accuracy(1));     

%########################################################################## 
end %functon svm_linear