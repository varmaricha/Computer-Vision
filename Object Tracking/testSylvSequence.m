load('sylvextbases.mat');
load('sylvextseq.mat');
u=0;
v=0;
rect= [122, 59, 169, 104];
newrect=[rect(1,1)+u,rect(1,2)+v,rect(1,3)+u,rect(1,4)+v];
rect1= [122, 59, 169, 104];
newrect1=[rect1(1,1)+u,rect1(1,2)+v,rect1(1,3)+u,rect1(1,4)+v];

for i=1:size(frames,3)

   
    [u,v]=LucasKanadeBasis(frames(:,:,i),frames(:,:,i+1),newrect,bases);
    newrect=[newrect(1,1)+u,newrect(1,2)+v,newrect(1,3)+u,newrect(1,4)+v];
    
    hold on;
    
     [u1,v1]=LucasKanade(frames(:,:,i),frames(:,:,i+1),newrect1);
     newrect1=[newrect1(1,1)+u1,newrect1(1,2)+v1,newrect1(1,3)+u1,newrect1(1,4)+v1];
    
end