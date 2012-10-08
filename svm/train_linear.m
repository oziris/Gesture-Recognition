function [svm_model, data_trans] = train_linear(train_data, train_label, normalization)
%TRAIN_LINEAR Train svm model with a linear kernel.
%
% [svm_model, data_trans] = train_linear(train_data, train_label, normalization)
% 
%   More information can be found at:
%       http://www.csie.ntu.edu.tw/~cjlin/libsvm/
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

if nargin < 3
    normalization = 1;
end

if normalization 
    % mean normalization: X_norm = (X-mu)/sigma
    mu = mean(train_data) ;
    sigma = std(train_data) ;
    data_trans.mu = mu ;
    data_trans.sigma = sigma ;
    data_trans.sigma = sigma + 1e-10 ;

    train_data = bsxfun(@minus, train_data, mu);
    train_data = bsxfun(@rdivide, train_data, sigma);
else
    data_trans.mu = 0;
    data_trans.sigma = 1;
end

% kernel selection
%{ 
-t kernel_type : set type of kernel function (default 2)
	0 -- linear: u'*v
	1 -- polynomial: (gamma*u'*v + coef0)^degree
	2 -- radial basis function: exp(-gamma*|u-v|^2)
	3 -- sigmoid: tanh(gamma*u'*v + coef0)
	4 -- intersection: sum(min(x,y))
	5 -- chi-square : exp( -gamma * (1-2*sum((xi-yi)^2/(xi + yi))) )
	6 -- precomputed kernel (kernel values in training_instance_matrix)
%}

fprintf('\n');
% parameter C
%C_vals = 2.^(-5:2:15);
C_vals = 2.^(-5:2:13);
bestcv = 0;
bestc = C_vals(1);
for i=1:length(C_vals)
    params = sprintf('-t 0 -v 5 -c %g', C_vals(i) );
    cv = libsvmtrain(train_label, train_data, params) ;   
    if (cv >= bestcv)
        bestcv = cv; bestc = C_vals(i);
    end
    fprintf('[%d] %g (best c=%g,rate=%g)\n', i, cv, bestc, bestcv);
end
fprintf('\n');

% train model
params = sprintf('-t 0 -c %g', bestc );

tic
svm_model = libsvmtrain(train_label, train_data, params) ;
toc

end %function train_linear