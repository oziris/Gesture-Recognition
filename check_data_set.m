function check_data_set(DATASET)
%CHECK_DATA_SET Validate DATASET.
%
%   check_data_det( DATASET )
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

if exist('OCTAVE_VERSION','var')
	% matlab
	error('check_data_set: animate works only in matlab');
end

numSubj = size(DATASET.subj,2);
numAct  = size(DATASET.subj(1).act,2);
numRec  = size(DATASET.subj(1).act(1).rec,2);
fprintf('Check DATASET!\n');
tic
for i=1:numSubj
    for j=1:numAct
        for k=1:numRec
            fprintf('Subj=%2d, Act=%2d, Rec=%1d\n',i,j,k);
            animate( DATASET.subj(i).act(j).rec(k).posMat );
        end
    end
end
toc
fprintf('\n');

end %function check_data_set

