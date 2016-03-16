function [ PrincipalCurvature ] = computePrincipalCurvature(DoGPyramid)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

PrincipalCurvature=ones(size(DoGPyramid));
R=ones(size(DoGPyramid,1), size(DoGPyramid,2));

for i=1:5

[Dx,Dy]=gradient(DoGPyramid(:,:,i));
[Dxx,Dxy]=gradient(Dx);
[Dyx,Dyy]=gradient(Dy);
H=[Dxx,Dxy;Dxy,Dyy];

Tr=Dxx+Dyy;
Deter=(Dxx.*Dyy)-((Dxy).^2);


R=((Tr).^2)./Deter;

PrincipalCurvature(:,:,i)=R;

end




end

