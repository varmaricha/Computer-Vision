clear all

%filterBank=createFilterBank();
%computeDictionary;
load('dictionary.mat');
load('../dat/traintest.mat'); 

layerNum=3;
L=layerNum-1;
a=50;
k=100;

dim=(k*((4^(L+1))-1))/3;
%wordHist = getImageFeaturesSPM(layerNum, wordMap, K);
allHist = zeros(dim,size(train_imagenames,2));

for j=1:size(train_imagenames,2)
% for j=1:2
    disp(j);
    I=imread(strcat('../dat/',train_imagenames{j}));
    if size(I,3)~=3
    I=repmat(I,[1,1,3]);   
    end
    
wordMap = getVisualWords(I, filterBank, dictionary);
wordHist = getImageFeaturesSPM(layerNum, wordMap, k);
allHist(:,j)=wordHist;
end

train_features = allHist;

%histInter = distanceToSet(wordHist, train_features);

save('vision.mat','filterBank','dictionary','train_features', 'train_labels'); 


