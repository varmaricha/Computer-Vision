function [locs, desc] = briefLite(im)

%Load parameters and test patterns
%Get keypoint locations
%Compute a set of valid BRIEF descriptors

load('testpattern.mat');
load('parameters.mat');


[locs, GaussianPyramid] = DoGdetector(im, sigma0, k, levels, th_contrast,th_r);
[locs,desc] = computeBrief(im, locs, levels, compareX, compareY);


end

