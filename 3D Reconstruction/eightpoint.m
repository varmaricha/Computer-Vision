function [ F ] = eightpoint( pts1, pts2, M )
% eightpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

%T=[2/640 0 -1;0 2/480 -1; 0 0 1];
T=M;

npts1=[pts1,ones(size(pts1,1),1)];
npts2=[pts2,ones(size(pts2,1),1)];
p1=(T*npts1')';
p2=(T*npts2')';

A=[p2(:,1).*p1(:,1), p2(:,1).*p1(:,2), p2(:,1), p2(:,2).*p1(:,1), p2(:,2).*p1(:,2), p2(:,2), p1(:,1), p1(:,2), ones(size(pts1,1),1)];

[U,D,V]=svd(A);
F=V(:,end);

F=reshape(F,[3,3]);

[Uf,Df,Vf]=svd(F);
Df(3,3)=0;

F=Uf*Df*Vf';
F2=refineF(F,p1,p2);

finalF= T'*F2*T;
F = finalF;

% Q2.1 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save F, M, pts1, pts2 to q2_1.mat

%     Write F and display the output of displayEpipolarF in your writeup

end

