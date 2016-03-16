function [wordMap] = getVisualWords(I, filterBank, dictionary)

dictionary=dictionary';
filterResponses=extractFilterResponses_richa(I,filterBank);

wordvector=pdist2(filterResponses,dictionary);

wordvector=wordvector.';

[M,index]=min(wordvector);
wordmap1=index;

wordMap=reshape(wordmap1,size(I,1),size(I,2));

end

