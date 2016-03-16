%p1= [ randi(10,4,2) ones(4,1)];
%p2= [randi(10,4,2) ones(4,1)];

H=computeH(p2',p1');
p1_calculated = H*[p2'; ones(1,4)];
p1_calculated = p1_calculated ./ repmat(p1_calculated(3,:),3,1);
p1'-p1_calculated(1:2, :)


mask2 = zeros(size(img2,1), size(img2,2));
mask2(1,:) = 1; mask2(end,:) = 1; mask2(:,1) = 1; mask2(:,end) = 1;
mask2 = bwdist(mask2, 'city');
mask2 = mask2/max(mask2(:));