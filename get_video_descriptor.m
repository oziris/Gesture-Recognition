function hist = get_video_descriptor(model, video)
%GET_VIDEO_DESCRIPTOR Get video descriptor.
%
% hist = get_video_descriptor(model, video)
%
%   model - path to the dataset 
%   video - feature frame sequence
%   
%   hist  - histogram
%
% Author: Samo Sela
% e-mail: samo.sela-at-gmail.com

bins = double(vl_kdtreequery(model.kdtree, model.vocab, ...
                             single(video), ...
                             'MaxComparisons', 15)) ;

hist = zeros(model.numWords,1);
hist = vl_binsum(hist, ones(size(bins)), bins) ;
hist = single(hist / sum(hist)) ;

%keyboard()

end