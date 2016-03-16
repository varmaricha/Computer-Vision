function [ DoGPyramid, DoGLevels ] = createDoGPyramid( GaussianPyramid, levels )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

L=size(levels,2); 
DOGPyramid=zeros(size(GaussianPyramid,1),size(GaussianPyramid,2),L-1);
DoGLevels=zeros(1,L-1);

for i=1:L-1
    
    DoGPyramid(:,:,i)=GaussianPyramid(:,:,(i+1))-GaussianPyramid(:,:,i);
    
    DoGLevels=levels(2:L);   
end



end

