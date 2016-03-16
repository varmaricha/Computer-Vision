function [ H2to1 ]=computeH(p1,p2)

for i=1:size(p1,2)
A1(i,:)=[p1(1,i),p1(2,i),1,0,0,0,-(p2(1,i)*p1(1,i)),-(p2(1,i)*p1(2,i)),-p2(1,i)];
A2(i,:)=[0,0,0,p1(1,i),p1(2,i),1,-(p2(2,i)*p1(1,i)),-(p2(2,i)*p1(2,i)),-p2(2,i)];
end
A=[A1;A2];

[U,S,V]=svd(A);
[val,index]=min(diag(S));
EigenVector= V(:,end);

H=reshape(EigenVector,3,3);
H2to1=H';

end

