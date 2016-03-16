function [boundingBoxes] = batchDetectImageESVM(imageNames, models, params)
% addpath(genpath('../utils'));
% addpath(genpath('../lib/esvm'));
% addpath(genpath('../data/voc2007'));
% load('../../data/bus_data.mat');
% params = esvm_get_default_params(); %get default detection parameters
boundingBoxes={};
for i=1:size(imageNames,2)
    I= imread(strcat('../../data/voc2007/',imageNames{i}));
    detectionBoxes = esvm_detect(I,models,params);
    boundingBoxes{i}= detectionBoxes;
end