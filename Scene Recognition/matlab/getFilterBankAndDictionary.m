function [filterBank, dictionary]=getFilterBankAndDictionary(image_names)

filterBank=createFilterBank();
a=50;
k=100;

for i=1:size(image_names,2)
    I=imread(image_names{i});
    if size(I,3)~=3
    I=repmat(I,[1,1,3]);   
    end
    filterResponses=extractFilterResponses_richa(I,filterBank);
    alpha=randperm(size(filterResponses,1),a);
    
    for j=1:a
        sel_filter_responses(j,:)=filterResponses(alpha(j),:);
    end
    
    fin_filter_responses{i}= sel_filter_responses;
end
fin_filter_responses=fin_filter_responses(:);
filter_responses=cell2mat(fin_filter_responses);

[~,dictionary]=kmeans(filter_responses,k,'EmptyAction','drop');

dictionary=dictionary.';
end



