function [bestH] = ransacH(matches, locs1, locs2, nIter, tol)

nmax=0;

p1=zeros(2,size(matches,1));
p2=zeros(2,size(matches,1));

p1(1,:)=locs1((matches(:,1)),1);
p1(2,:)=locs1((matches(:,1)),2);

p2(1,:)=locs2((matches(:,2)),1);
p2(2,:)=locs2((matches(:,2)),2);

ones_row=ones(1,size(p1,2));
p1=[p1;ones_row];
p2=[p2;ones_row];

for i=1:nIter

r=randperm(size(p1,2),4);
sample1=p1(:,r);
sample2=p2(:,r);

% sample1=p1(:,randperm(size(p1,2),4));
% sample2=p2(:,randperm(size(p2,2),4));

sampleH=computeH(sample2,sample1);

estp1 = sampleH*p2;
estp1=estp1./repmat(estp1(3,:),3,1);
%error=pdist2(estp1',p1');
%err=diag(error);

diff=estp1-p1;
err=sqrt((diff(1,:).^2)+(diff(2,:).^2));

d=err<tol;
num=sum(d);

if num>nmax
    nmax=num;
    bestH=sampleH;
    H2to1=bestH;
end

end

end

