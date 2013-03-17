% This make.m is used under Windows

% add -largeArrayDims on 64-bit machines

mex -O -largeArrayDims -c svm.cpp
mex -O -largeArrayDims -c svm_model_matlab.c
mex -O -largeArrayDims libsvmtrain.c svm.obj svm_model_matlab.obj
mex -O -largeArrayDims libsvmpredict.c svm.obj svm_model_matlab.obj

mex -O -largeArrayDims read_sparse.c

mex -O -largeArrayDims libsvmread.c
mex -O -largeArrayDims libsvmwrite.c
