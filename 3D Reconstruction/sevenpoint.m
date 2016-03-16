function [ F ] = sevenpoint( pts1, pts2, M )
% sevenpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)
T=M;
%T=[1/M 0 0;0 1/M 0; 0 0 1];

npts1=[pts1,ones(size(pts1,1),1)];
npts2=[pts2,ones(size(pts2,1),1)];
p1=(T*npts1')';
p2=(T*npts2')';

A=[p2(:,1).*p1(:,1), p2(:,1).*p1(:,2), p2(:,1), p2(:,2).*p1(:,1), p2(:,2).*p1(:,2), p2(:,2), p1(:,1), p1(:,2), ones(size(pts1,1),1)];

[U,D,V]=svd(A);
F1= V(:,9);
F2= V(:,8);
F1=reshape(F1,[3,3]);
F2=reshape(F2,[3,3]);

syms a;
F= a*F1+(1-a)*F2;
D=det(F);
c=sym2poly(D);
r=roots(c);
a=r(3,1);

F= a*F1+(1-a)*F2;

finalF= T'*F*T;
F=finalF;

% Q2.2 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save recovered F (either 1 or 3 in cell), M, pts1, pts2 to q2_2.mat

%     Write recovered F and display the output of displayEpipolarF in your writeup

end

