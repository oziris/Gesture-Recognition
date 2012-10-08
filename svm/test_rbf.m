function [predicted_label, accuracy, decision_values] = test_rbf(test_data, test_label, svm_model, data_trans, normalization)
%TEST_RBF Test svm model with a rbf kernel.
% 
% [predicted_label, accuracy, decision_values] = test_rbf(test_data, test_label, svm_model, data_trans, normalization)
%
%   More information can be found at:
%       http://www.csie.ntu.edu.tw/~cjlin/libsvm/
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

if nargin < 5
    normalization = 1;
end

if normalization
    % mean normalization: X_norm = (X-mu)/sigma
    test_data = bsxfun(@minus, test_data, data_trans.mu);
    test_data = bsxfun(@rdivide, test_data, data_trans.sigma);
end

if isempty(test_label)
    test_label = ones(size(test_data,2),1) ;
end

[predicted_label, accuracy, decision_values] = libsvmpredict(test_label, test_data, svm_model);
 
end %function test_rbf

