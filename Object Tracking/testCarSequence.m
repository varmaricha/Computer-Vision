load('carseq.mat');
u=0;
v=0;
newrect=[rect(1,1)+u,rect(1,2)+v,rect(1,3)+u,rect(1,4)+v];

for i=1:size(frames,3);
    [u,v]=LucasKanade(frames(:,:,i),frames(:,:,i+1),newrect);
    newrect=[newrect(1,1)+u,newrect(1,2)+v,newrect(1,3)+u,newrect(1,4)+v];
end