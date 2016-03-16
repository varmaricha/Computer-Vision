function [filterResponses] = extractFilterResponses(I, filterBank)
% CV Fall 2015 - Provided Code
% Extract the filter responses given the image and filter bank
% Pleae make sure the output format is unchanged. 
% Inputs: 
%   I:                  a 3-channel RGB image with width W and height H 
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses
I=repmat(I,[1,1,3]);
%Convert input Image to Lab
doubleI = double(I);
[L,a,b] = RGB2Lab(doubleI(:,:,1), doubleI(:,:,2), doubleI(:,:,3));
pixelCount = size(doubleI,1)*size(doubleI,2);
N=20;
%filterResponses:    a W*H x N*3 matrix of filter responses
filterResponses = zeros(pixelCount, length(filterBank)*3);



%for each filter and channel, apply the filter, and vectorize

for i=1:N
    Lf=imfilter(L,filterBank{i},'replicate');
    Lf=reshape(Lf,pixelCount,1);
    af=imfilter(a,filterBank{i},'replicate');
    af=reshape(af,pixelCount,1);
    bf=imfilter(b,filterBank{i},'replicate');
    bf=reshape(bf,pixelCount,1);
fb{i}=horzcat(Lf,af,bf); 
end

filterResponses=cell2mat(fb);
    
% === fill in your implementation here  ===



end
