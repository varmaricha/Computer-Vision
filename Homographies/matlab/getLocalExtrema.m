function [locs] = getLocalExtrema(DoGPyramid, DoGLevels, PrincipalCurvature, th_contrast, th_r)


maxima=imregionalmax(DoGPyramid);
minima=imregionalmin(DoGPyramid);
extrema=maxima+minima;


[a,b,c]=ind2sub(size(DoGPyramid),find((abs(DoGPyramid)>th_contrast)&(PrincipalCurvature>0 & PrincipalCurvature<th_r)& extrema));

d=DoGLevels(c);
d=d';

locs(:,2)=a;
locs(:,1)=b;
locs(:,3)=d;

end

%[e,f,g]=ind2sub(size(PrincipalCurvature),find(PrincipalCurvature>0 & PrincipalCurvature<th_r));
%[x,y,z]=ind2sub(size(extrema),find(extrema));















