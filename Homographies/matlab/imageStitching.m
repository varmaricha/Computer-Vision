function [panoImg] = imageStitching(img1, img2, H2to1)


img1 = im2double(img1);
if size(img1,3)==3
    img1= rgb2gray(img1);
end

img2 = im2double(img2);
if size(img2,3)==3
    img2= rgb2gray(img2);
end


mask1 = zeros(size(img1,1), size(img1,2));
mask1(1,:) = 1; mask1(end,:) = 1; mask1(:,1) = 1; mask1(:,end) = 1;
mask1 = bwdist(mask1, 'city');
mask1 = mask1/max(mask1(:));

mask2 = zeros(size(img2,1), size(img2,2));
mask2(1,:) = 1; mask2(end,:) = 1; mask2(:,1) = 1; mask2(:,end) = 1;
mask2 = bwdist(mask2, 'city');
mask2 = mask2/max(mask2(:));
  
warpimg2=warpH(img2,H2to1,[800 1200]);
warpmask2=warpH(mask2,H2to1,[800 1200]);

M1=[1,0,0;0,1,0;0,0,1];
warpimg1=warpH(img1,M1,[800 1200]);
warpmask1=warpH(mask1,M1,[800 1200]);

weights=warpmask1+warpmask2;

maskedimg1=warpmask1.*warpimg1;
maskedimg2=warpmask2.*warpimg2;

final=imadd(maskedimg1,maskedimg2);
final=final./weights;

panoImg=final;

end

