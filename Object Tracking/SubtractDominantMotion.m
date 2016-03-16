function mask = SubtractDominantMotion(image1, image2)

It=image1;
It1=image2;

M= LucasKanadeAffine(It, It1);

tform=affine2d(M');

It1_warp=imwarp(It1,tform,'OutputView',imref2d(size(It1)));

err=It-It1_warp;

se=strel('ball',10,10);    
new=imdilate(err,se);
%imshow(new);

level=graythresh(new);
BW=im2bw(new, level);

BW2=imclearborder(BW);
% CC=bwconncomp(BW);
% num=CC.PixelIdxList;
% l=size(num,2);
%BW2=bwareaopen(BW,650);
%imshow(BW);

mask=BW2;
end

