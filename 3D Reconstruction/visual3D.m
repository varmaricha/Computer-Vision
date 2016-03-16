load('templeCoords.mat');

x2=zeros(size(x1));
y2=zeros(size(y1));

for i=1: size(x1,1)
    
[x2(i,1),y2(i,1)]= epipolarCorrespondence( im1, im2, F, x1(i,1), y1(i,1));
end

p1=[x1,y1];
p2=[x2,y2];

[ P, error ] = triangulate( K1*M1, p1, K2*M2, p2 );

scatter3(P(:,1),P(:,2),P(:,3))

