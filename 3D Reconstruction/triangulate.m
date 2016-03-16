function [ P, error ] = triangulate( M1, p1, M2, p2 )
% triangulate:
%       M1 - 3x4 Camera Matrix 1
%       p1 - Nx2 set of points
%       M2 - 3x4 Camera Matrix 2
%       p2 - Nx2 set of points

P=zeros(size(p1,1),3);
P1=M1;
P2=M2;
%P1=K1*M1;
%P2=K2*M2;
p1=[p1,ones(size(p1,1),1)];
p2=[p2,ones(size(p2,1),1)];
x1=zeros(size(p1));
x2=zeros(size(p2));

for i=1:size(p1,1)

u1=p1(i,1);
v1=p1(i,2);
u2=p2(i,1);
v2=p2(i,2);
P1_1=P1(1,:);
P1_2=P1(2,:);
P1_3=P1(3,:);
P2_1=P2(1,:);
P2_2=P2(2,:);
P2_3=P2(3,:);


A = [u1*P1_3-P1_1 ; v1*P1_3-P1_2 ; u2*P2_3-P2_1 ; v2*P2_3-P2_2];

[U,D,V]=svd(A);
X=V(:,end);
% X=X./X(end,1);
X=X./X(end,1);

x1(i,:)=P1*X;
%x1=x1./x1(end,1);
x2(i,:)=P2*X;
%x2=x2./x2(end,1);
X=X(1:3,1);

P(i,:)=X';

end


for i=1:size(p1)
x1(i,:)=x1(i,:)./x1(i,3);
x2(i,:)=x2(i,:)./x2(i,3);
end
% x1=x1/x1(:,end);
% x2=x2/x2(:,end);

error = sum (diag(pdist2(p1,x1)) + diag(pdist2(p2,x2)));

%error = sum((p1 - x1).^2 + (p2 - x2).^2);

% Q2.4 - Todo:
%       Implement a triangulation algorithm to compute the 3d locations
%       See Szeliski Chapter 7 for ideas
%


end

