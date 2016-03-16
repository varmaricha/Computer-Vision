% Q2.5 - Todo:
%       1. Load point correspondences
%       2. Obtain the correct M2
%       4. Save the correct M2, p1, p2, R and P to q2_5.mat

im1=imread('im1.png');
im2=imread('im2.png');
T=[2/size(im1,2) 0 -1;0 2/size(im1,1) -1; 0 0 1];
M=T;
load('some_corresp.mat');
load('intrinsics.mat');
M1=[eye(3,3), zeros(3,1)];
F = eightpoint( pts1, pts2, M );
E = essentialMatrix( F, K1, K2 );
M2s = camera2(E);

p1=pts1;
p2=pts2;
pmin=zeros(4,1);
M2=zeros(3,4);
Pcell=cell(4,1);

[P1, error1]=triangulate(K1*M1,p1,K2*M2s(:,:,1),p2);
[P2, error2]=triangulate(K1*M1,p1,K2*M2s(:,:,2),p2);
[P3, error3]=triangulate(K1*M1,p1,K2*M2s(:,:,3),p2);
[P4, error4]=triangulate(K1*M1,p1,K2*M2s(:,:,4),p2);

Pcell{1}=P1;
Pcell{2}=P2;
Pcell{3}=P3;
Pcell{4}=P4;

pmin(1,1) = min(P1(:,3));
pmin(2,1) = min(P2(:,3));
pmin(3,1) = min(P3(:,3));
pmin(4,1) = min(P4(:,3));

pmin=pmin>0;

for i=1:4
    if pmin(i,1)==1
        M2=M2s(:,:,i);
        P=Pcell(i,1);
        P=cell2mat(P);
    end
end

%save('q2_5.mat','M2','p1','p2','P');
