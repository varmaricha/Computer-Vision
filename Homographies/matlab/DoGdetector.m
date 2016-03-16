function [locs, GaussianPyramid] = DoGdetector(im, sigma0, k, levels, th_contrast,th_r)

GaussianPyramid = createGaussianPyramid(im, sigma0, k, levels);
[ DoGPyramid, DoGLevels ] = createDoGPyramid( GaussianPyramid, levels );
PrincipalCurvature = computePrincipalCurvature(DoGPyramid);
locs = getLocalExtrema(DoGPyramid, DoGLevels, PrincipalCurvature, th_contrast, th_r);

imshow(im);
hold on
scatter((locs(:,1))',(locs(:,2))','r','filled')


end

