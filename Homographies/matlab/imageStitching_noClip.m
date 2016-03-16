function [panoImg] = imageStitching_noClip(img1, img2, H2to1)


out_width=500;

[locs1,desc1]= briefLite(img1);
[locs2,desc2]= briefLite(img2);
[matches] = briefMatch(desc1, desc2);

P1(1,:)=locs1((matches(:,1)),1);
P1(2,:)=locs1((matches(:,1)),2);

P2(1,:)=locs2((matches(:,2)),1);
P2(2,:)=locs2((matches(:,2)),2);

ones_row=ones(1,size(P1,2));
P1=[P1;ones_row];
P2=[P2;ones_row];


img1corners=[1,1,1;1,size(img1,1),1;size(img1,2),size(img1,1),1;size(img1,2),1,1]';
img2corners=[1,1,1;1,size(img2,1),1;size(img2,2),size(img2,1),1;size(img2,2),1,1]';


P2to1corners=H2to1*img2corners;
P2to1corners=P2to1corners./repmat(P2to1corners(3,:),3,1);

width=sqrt(((P2to1corners(1,3)-img1corners(1,1)).^2)+((P2to1corners(2,3)-img1corners(2,1)).^2));

height1=sqrt(((P2to1corners(1,3)-P2to1corners(1,4)).^2)+((P2to1corners(2,3)-P2to1corners(2,4)).^2));
height2=sqrt(((img1corners(1,1)-img1corners(1,2)).^2)+((img1corners(2,1)-img1corners(2,2)).^2));
height=max(height1,height2);
aspectratio=width/height;

out_height=round(out_width/aspectratio);
out_size=[out_height out_width];

sx=out_width/width;
sy=out_height/height;

new_height=height*sx;
new_width=width*sy;

%tx=(new_width-width);
%ty=(new_height-height);


M=[sx 0 0;0 sy 0;0 0 1];

warp_img1 = warpH(img1, M, out_size);
warp_img2 = warpH(img2, M*H2to1, out_size);



panoImg=imfuse(warp_img1,warp_img2,'blend');
imshow(panoImg);

end

