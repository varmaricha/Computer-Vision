function [locs,desc] = computeBrief(im, locs, levels, compareX, compareY)

nbits=256;
patchWidth=9;
sigma0=1;
k=sqrt(2);
th_r=12;
th_contrast=0.03;
j=0;

%%load(testpattern.mat);
%brief=zeros(1,nbits);
GaussianPyramid = createGaussianPyramid(im, sigma0, k, levels);

for i=1:size(locs,1)

%row=locs(i,2);
%col=locs(i,1);
row1=int32(locs(i,2)-(patchWidth/2));
row2=row1+(patchWidth-1);
col1=int32(locs(i,1)-(patchWidth/2));
col2=col1+(patchWidth-1);

if (row1>=1 && row1<size(GaussianPyramid,1) && col1>=1 && col1<size(GaussianPyramid,2) && row2>=1 && row2<size(GaussianPyramid,1) && col2>=1 && col2<size(GaussianPyramid,2))    

%if (row>4 && col>4 && row<size(GaussianPyramid,2)-4 && col<size(GaussianPyramid,1)-4)
    
%%subImage=GaussianPyramid(row-4:row+4,col-4:col+4,(1+locs(i,3)));

subImage=GaussianPyramid(row1:row2,col1:col2,1+locs(i,3));

diff=subImage(compareX)<subImage(compareY);
diff=diff';
j=j+1;
desc(j,:)=diff;
disp(j)
locsnew(j,:)=locs(i,:);

end

end

locs=locsnew;

save ('parameters.mat', 'k','sigma0','nbits','levels','th_r', 'th_contrast', 'patchWidth');
end

