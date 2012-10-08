function [ F ] = compute_features( posMat, normalize, param )
%COMPUTE_FEATURES Compute the feature vectors.
%
% [ F ] = compute_features( posMat, normalize )
%
%   posMat - position matrix (k x p x 3, k is the number of frames, 
%                             p is the number of joint positions)
%   normalize - the feature vector is normalized by diving the vector
%               by the standard deviation of the vector
%
%   F      - feature vector
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

%%======================================================================
% size(DATASET.subj(1).act(1).rec(1).posMat)
%%======================================================================
% [ N , p, d] = size(posMat);
[ N , p, d] = size(posMat);

% f_size = p(p-1)/2 + p^2 + p^2
%        = 15(15-1)/2 + 15^2 + 15^2
%    555 = 105 + 225 + 225
f_size = p*(p-1)./2 + 2*p.^2;

F = zeros(N-1,f_size);

switch param
    %===================================================================
    % iccv - 2011
    %===================================================================
    case 'iccv'
        
        frame = zeros(p,d);
        first = zeros(p,d);
        previous = zeros(p,d);

        % handle first frame
        first(:,:) = posMat(1,:,:);
        previous(:,:) = first;

        % all the rest
        for i=2:N
            frame(:,:) = posMat(i,:,:);
            % basic set of features
            x1 = single_frame(frame);

            % motion set of features
            x2 = (two_frames(frame,previous,d))';

            % dynamic set of features
            x3 = (two_frames(frame,first,d))';

            % assemble feature vector
            v = [x1 x2 x3];

            % normalize
            if strcmp(normalize,'yes')
                v = v ./ std(v);
            end

            F(i-1,:) = v;

            previous = frame;
        end
        
    %===================================================================
    % ijcv - 2012
    %===================================================================
    case 'ijcv'
        
        %%TODO !!!
        error('compute_features: TODO');
        
        
    %===================================================================
    % error
    %===================================================================     
    otherwise
        error('compute_features: erroneous param');
    end
        
end %function compute_features

%%======================================================================
function [x] = single_frame(f)
    % F size: [number of joints] x [d dimensions]
    x = pdist(f,'euclidean');
end %function single_frame

%%======================================================================
function [x] = two_frames(f1,f2,d)
    % F size: [number of joints] x [d dimensions]
    
    K = size(f1,1);
    
    x1 = zeros(K*K,d);
    x2 = zeros(K*K,d);
    
    % generate all pairs
    for i = 1:K
        % rotate left
        x1((i-1)*K+1:i*K,:) = f1([i:end 1:i-1],:);       
        % copy over
        x2((i-1)*K+1:i*K,:) = f2;
    end
    
    % Euclidean distance
    x = x1-x2;
    x = sqrt(sum(x.*x,2));
end %function two_frames

%%======================================================================
function [xt] = translate_skeleton(x)

end %function translate_skeleton