 
% Does computation of the filter bank and dictionary, and saves
% it in dictionary.mat 

clear all
filterBank=createFilterBank();
load('../dat/traintest.mat'); 
[filterBank,dictionary] = getFilterBankAndDictionary(strcat('../dat/',train_imagenames));
%wordMap = getVisualWords(I, filterBank, dictionary);
save('dictionary.mat','filterBank','dictionary'); 

