function [F] = ransacF(pts1, pts2, M )

nmax=0;
nIter=1000;
tol= 0.01;

for i=1:nIter


r=randperm(size(pts1,1),7);
sample1=pts1(r,:);
sample2=pts2(r,:);
npts1=[pts1,ones(size(pts1,1),1)];
npts2=[pts2,ones(size(pts2,1),1)];


sampleF=sevenpoint( sample1, sample2, M );

for j=1:size(pts1,1)
    metric=npts2(j,:)*sampleF*npts1(j,:)';
    metric=abs(metric);


d=metric<tol;
num=sum(d);

if num>nmax
    nmax=num;
    bestF=sampleF;
    F=bestF;
end

end

end

