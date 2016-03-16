function [h] = getImageFeatures(wordMap, dictionarySize)

%wordMap is a H × W image containing the IDs of the visual words
% dictionarySize is the maximum visual word ID (i.e., the number of visual words, the dictionary size) 

%As output, the function will return h, a dictionarySize × 1 histogram that is L1 normalized, (i.e.,Phi = 1). 

h1= hist(wordmap(:),dictionarySize);
h=h1/sum(h1);

end

