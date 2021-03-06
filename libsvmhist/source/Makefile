# This Makefile is used under Linux

#MATLABDIR ?= /usr/local/matlab
MATLABDIR ?= /usr/local/MATLAB/R2011b
# for Mac
#MATLABDIR ?= /opt/matlab

#CXX ?= g++
CXX = g++
CFLAGS = -Wall -Wconversion -O3 -fPIC -I$(MATLABDIR)/extern/include

MEX = $(MATLABDIR)/bin/mex
MEX_OPTION = CC\#$(CXX) CXX\#$(CXX) CFLAGS\#"$(CFLAGS)" CXXFLAGS\#"$(CFLAGS)"
# comment the following line if you use MATLAB on 32-bit computer
MEX_OPTION += -largeArrayDims
MEX_EXT = $(shell $(MATLABDIR)/bin/mexext)

OCTAVEDIR ?= /usr/include/octave
OCTAVE_MEX = env CC=$(CXX) mkoctfile
OCTAVE_MEX_OPTION = --mex
OCTAVE_MEX_EXT = mex
OCTAVE_CFLAGS = -Wall -O3 -fPIC -I$(OCTAVEDIR)

all:	matlab

matlab:	binary copyfiles

octave:
	@make MEX="$(OCTAVE_MEX)" MEX_OPTION="$(OCTAVE_MEX_OPTION)" \
	MEX_EXT="$(OCTAVE_MEX_EXT)" CFLAGS="$(OCTAVE_CFLAGS)" \
	binary

binary: libsvmpredict.$(MEX_EXT) libsvmtrain.$(MEX_EXT) libsvmread.$(MEX_EXT) libsvmwrite.$(MEX_EXT)

libsvmpredict.$(MEX_EXT): libsvmpredict.c svm.h svm.o svm_model_matlab.o
	$(MEX) $(MEX_OPTION) libsvmpredict.c svm.o svm_model_matlab.o

libsvmtrain.$(MEX_EXT): libsvmtrain.c svm.h svm.o svm_model_matlab.o
	$(MEX) $(MEX_OPTION) libsvmtrain.c svm.o svm_model_matlab.o

libsvmread.$(MEX_EXT): libsvmread.c
	$(MEX) $(MEX_OPTION) libsvmread.c

libsvmwrite.$(MEX_EXT): libsvmwrite.c
	$(MEX) $(MEX_OPTION) libsvmwrite.c

svm_model_matlab.o: svm_model_matlab.c svm.h
	$(CXX) $(CFLAGS) -c svm_model_matlab.c

svm.o: svm.cpp svm.h
	$(CXX) $(CFLAGS) -c svm.cpp

copyfiles:
	mv libsvmpredict.$(MEX_EXT) ../libsvmpredict.$(MEX_EXT)
	mv libsvmtrain.$(MEX_EXT) ../libsvmtrain.$(MEX_EXT)
	mv libsvmread.$(MEX_EXT) ../libsvmread.$(MEX_EXT)
	mv libsvmwrite.$(MEX_EXT) ../libsvmwrite.$(MEX_EXT)

clean:
	rm -f *~ *.o *.mex* *.obj

