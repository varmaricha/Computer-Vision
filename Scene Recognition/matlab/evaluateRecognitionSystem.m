load('../dat/traintest.mat');

guessed_labels=zeros(1,160);

fprintf('[Loading..]\n');
for j=1:size(test_imagenames,2)
% for j=1:2
    disp(j);
    I=imread(strcat('../dat/',test_imagenames{j}));
    if size(I,3)~=3
    I=repmat(I,[1,1,3]);   
    end
% imshow(image);
fprintf('[Getting Visual Words..]\n');
wordMap = getVisualWords(I, filterBank, dictionary);
h = getImageFeaturesSPM(3, wordMap, size(dictionary,2));
distances = distanceToSet(h, train_features);
[~,nnI] = max(distances);
load('../dat/traintest.mat','mapping');
guessedImage = mapping{train_labels(nnI)};
guessed_labels(j) = train_labels(nnI);
fprintf('[My Guess]:%s.\n',guessedImage);
end

[Conf,~]=confusionmat(test_labels,guessed_labels);

accuracy = (trace(Conf))/(sum(Conf(:)));


