im1=imread('incline_L.png');

im2=imread('incline_R.png');

[locs1,desc1]= briefLite(im1);
[locs2,desc2]= briefLite(im2);


[matches] = briefMatch(desc1, desc2);
plotMatches(im1, im2, matches, locs1, locs2);
plotMatches(im1, im2, matches, locs1, locs2);


p1=zeros(2,size(matches,1));
p2=zeros(2,size(matches,1));

p1(1,:)=locs1((matches(:,1)),1);
p1(2,:)=locs1((matches(:,1)),2);

p2(1,:)=locs2((matches(:,2)),1);
p2(2,:)=locs2((matches(:,2)),2);


