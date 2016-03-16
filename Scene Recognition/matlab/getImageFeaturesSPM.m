function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)

L=layerNum-1;
%dim=(dictionarySize*((4^(L+1))-1))/3;


for l=0:2

%r=size(I,1);
c=size(wordMap,2);
m1=(mod(size(wordMap,1),2^l));
m2=(mod(size(wordMap,2),2^l));

if ((mod(size(wordMap,1),2^l))~=0)
  nrow=size(wordMap,1)-m1;
  wordMap=imcrop(wordMap,[0 0 c nrow]);
end

if ((mod(size(wordMap,2),2^l))~=0)
    ncol=size(wordMap,2)-m2;
    wordMap=imcrop(wordMap,[0 0 ncol size(wordMap,1)]);
end

fun= @(block_struct) hist(block_struct.data(:),1:dictionarySize);
B=blockproc(wordMap,[floor(size(wordMap,1)/2^l) floor(size(wordMap,2)/2^l)],fun);

C=reshape(B,numel(B), 1);

h{l+1}= C;
h{l+1}=(1/sum(h{l+1}))*h{l+1};

% for l=0,1
if (l==0 || l==1)
h{l+1}=(h{l+1}/(2^(-L)))*sum(h{l+1});
end

%for l=2;
if (l==2)
h{l+1}=(h{l+1}/(2^(l-L-1)))*sum(h{l+1});
end


end

h=h';
g=h;
h=cell2mat(g);
h = h/sum(h(:));



