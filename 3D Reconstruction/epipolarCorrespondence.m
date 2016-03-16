function [ x2, y2 ] = epipolarCorrespondence( im1, im2, F, x1, y1 )
% epipolarCorrespondence:
%       im1 - Image 1
%       im2 - Image 2
%       F - Fundamental Matrix between im1 and im2
%       x1 - x coord in image 1
%       y1 - y coord in image 1

im1=rgb2gray(im1);
im1=im2double(im1);
im2=rgb2gray(im2);
im2=im2double(im2);


error=zeros(100,1);
L = (F*[x1,y1,1]');

 %n=sqrt(L(1,:).^2 +L(2,:).^2);
 %L1=L./repmat(n,3,1);
% m=-(L1(2,:))./L1(1,:);

a=L(1,:);
b=L(2,:);
c=L(3,:);

% line= a*x1 + b*y1 + c;

window1 = im1(y1-5:y1+5,x1-5:x1+5);

for i=1:100 
    
    y2lin=y1-49+i;
    x2lin=(-c-(b*y2lin))/a;
    %x2lin= m*y2lin + c;
    x2lin=round(x2lin);
    
%     ylin1=y1-2+i;
%     ylin2=y1+2+i;  
%     xlin1= (-c-(b*ylin1))/a;
%     xlin1=ceil(xlin1);
%     xlin2= (-c-(b*ylin2))/a;
%     xlin2=floor(xlin2);
    
    window2 = im2(y2lin-5:y2lin+5, x2lin-5:x2lin+5);
    %check=pdist2(window1,window2);
    %error(i,1) = sum(diag(pdist2(window1,window2)));
    error(i,1)=sum(sum(abs((window1-window2))));
    
end

[val,ind]=min(error);

y2=y1+ind-49;
x2=(-c-b*y2)/a;
x2=round(x2);


end

