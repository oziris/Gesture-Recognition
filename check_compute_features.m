function [F] = check_compute_features(check)
%CHECK_COMPUTE_FEATURES 
%
% [F] = check_compute_features(check_id)
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

% DATASET.subj(1).act(1).rec(1).posMat)
switch check
    case 1
        fprintf('d([1,1,1;1,1,1]) = %g\n', pdist([1,1,1;1,1,1]))
        fprintf('d([1,1,1;2,2,2]) = %g\n', pdist([1,1,1;2,2,2]))
        fprintf('d([1,1,1;3,3,3]) = %g\n', pdist([1,1,1;3,3,3]))
        fprintf('d([2,2,2;3,3,3]) = %g\n', pdist([2,2,2;3,3,3]))

        example = zeros(3,3,3);
        example(1,:,:) = ones(3,3);
        example(2,:,:) = 2*ones(3,3);
        example(3,:,:) = 3*ones(3,3);

    case 2
        fprintf('d([1,1,1;1,1,1]) = %g\n', pdist([1,1,1;1,1,1]))
        fprintf('d([1,1,1;2,2,2]) = %g\n', pdist([1,1,1;2,2,2]))
        fprintf('d([1,1,1;3,3,3]) = %g\n', pdist([1,1,1;3,3,3]))
        fprintf('d([2,2,2;3,3,3]) = %g\n', pdist([2,2,2;3,3,3]))     
        
        example = zeros(3,15,3);
        example(1,:,:) = ones(15,3);
        example(2,:,:) = 2*ones(15,3);
        example(3,:,:) = 3*ones(15,3);
        
    case 3
        tmp1 = [ 1 0 0 ; 2 0 0 ; 3 0 0 ]
        tmp2 = [ 0 3 0 ; 0 2 0 ; 0 1 0 ]
        tmp3 = [ 0 0 6 ; 0 0 5 ; 0 0 4 ]
        
        example = zeros(4,3,3);
        example(2,:,:) = tmp1;
        example(3,:,:) = tmp2;
        example(4,:,:) = tmp3;

    case 4
        tmp1 = [ 1 1 0 ; 1 2 0 ]
        tmp2 = [ 1 1 1 ; 1 2 1 ]
        tmp3 = [ 1 1 2 ; 1 2 2 ]
        
        example = zeros(3,2,3);
        example(1,:,:) = tmp1;
        example(2,:,:) = tmp2;
        example(3,:,:) = tmp3;
        
    case 5
        tmp1 = [ 1 1 0 ; 3 1 0 ; 2 (sqrt(3)+1) 0 ]
        tmp2 = [ 1 1 1 ; 3 1 1 ; 2 (sqrt(3)+1) 1 ]
        tmp3 = [ 1 1 2 ; 3 1 2 ; 2 (sqrt(3)+1) 2 ]
        
        example = zeros(3,3,3);
        example(1,:,:) = tmp1;
        example(2,:,:) = tmp2;
        example(3,:,:) = tmp3;
        
    case 6
        tmp1 = [ 0 0 0 ; 1 0 0 ; 0 1 0 ; 1 1 0 ]
        tmp2 = [ 0 0 1 ; 1 0 1 ; 0 1 1 ; 1 1 1 ]
        tmp3 = [ 0 0 2 ; 1 0 2 ; 0 1 2 ; 1 1 2 ]
        tmp4 = [ 0 0 3 ; 1 0 3 ; 0 1 3 ; 1 1 3 ]
        
        example = zeros(4,4,3);
        example(1,:,:) = tmp1;
        example(2,:,:) = tmp2;
        example(3,:,:) = tmp3;    
        example(4,:,:) = tmp4;   
        
    otherwise
        error('Unknown parameter!') ;
        
end %switch       

F = compute_features(example, 'no', 'iccv');

fprintf('\nExample size: %d\n',size(example,1))
fprintf('F size (example - 1): %d\n\n', size(F,1))

%F(1,:);
%F(2,:);

end %function check_compute_features 

