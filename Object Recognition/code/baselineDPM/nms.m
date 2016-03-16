function [refinedBBoxes] = nms(bboxes, bandwidth,K)
scores= bboxes(:,5);
norm_scores= scores-min(scores)/(max(scores)- min(scores));
bboxes(:,5)= norm_scores;
StopThresh= 0.1;
[CCenters,CMemberships]= MeanShift(bboxes,bandwidth,StopThresh);
avg_score=zeros(size(CCenters,1),1);

for r=1:size(CCenters,1)
    ind= find(CMemberships==r);
    W= [norm_scores(ind),ind];
    n=size(W,1);
    avg_score(r,1)=sum(W(:,1))/n;
%  [s,I]=max(W(:,1));
%   index= W(I,2);
    
      %  refinedBBoxes(r,:)=bboxes(index,:);
end

[sorted_scores,index]=sort(avg_score,'descend');
top_indices=index(1:min(K,size(CCenters,1)));

for j=1:min(K,size(CCenters,1))
    refinedBBoxes(j,:)=bboxes(top_indices(j),:);
end

