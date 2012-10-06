Gesture-Recognition
===================

Bag of Words model for gesture recognition

Article: Measuring and Reducing Observational Latency when Recognizing Actions
         http://www.cs.ucf.edu/~smasood/publications/ICCV2011_LatencyReduction.pdf

Dataset: http://www.cs.ucf.edu/~smasood/datasets/UCFKinect.zip

[Part 6.1.1]: Bag of Words Model
The bag of words is computed using the same distances described in Section 5. 
The expansion to binary features was not used because the raw distance values 
performed best on this classifier. 
The BoW representation is created by quantizing the feature representation of 
each frame to one of 1000 clusters. The clusters were chosen randomly from the 
dataset. This had similar performance to using the k-means algorithm to find 
the centers, but was significantly faster.
Each video is represented by a histogram describing the frequency of each 
cluster center. Histograms are normalized to avoid bias based on the length of 
the video. The classifier is implemented using an SVM based on the histogram
intersection kernel.


LibSVM with Intersection + Chi Square Kernels:
http://dovgalecs.com/blog/libsvm-3-0-matlab-with-intersection-kernel/


Experiment source: experiment.m