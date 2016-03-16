function M = LucasKanadeAffine(It, It1)

% M=zeros(3,3);
% xt=[x1,y1,1];
% xt1=[x2,y2,1];
% J=[x 0 y 0 1 0; 0 x 0 y 0 1];
p=[0,0,0,0,0,0]';
M=[1+p(1,:) p(2,:) p(3,:); p(4,:) 1+p(5,:) p(6,:); 0 0 1];
p_del=[1,1,1,1,1,1]';
thres=50/255;

% p=[u,v]';
% p=[1 0 0;0 1 0;u v 1];
It1= im2double(It1);
It= im2double(It);

% [xm,ym]=meshgrid(rect(1,:):rect(3,:),rect(2,:):rect(4,:));
[xm,ym]=meshgrid(1:size(It,2),1:size(It,1));
[xm1,ym1]=meshgrid(1:size(It1,2),1:size(It1,1));



while(norm(p_del)>thres)

% xt1=M*xm;
% yt1=M*ym;

% It1_interp = interp2(It1,xt1,yt1);
% It1_interp = interp2(It1,1+p(1,1)*xm + p(2,1)*ym + p(3,1) , p(4,1)*xm + (1+p(5,1))*ym + p(6,1));

tform=affine2d(M');
It1_warp = imwarp(It1,tform,'OutputView',imref2d(size(It)));

error=It-It1_warp;

[gx,gy]=imgradientxy(It1);

% gx_interp = interp2(gx,1+p(1,1)*xm + p(2,1)*ym + p(3,1) , p(4,1)*xm + (1+p(5,1))*ym + p(6,1));
% gy_interp = interp2(gy,1+p(1,1)*xm + p(2,1)*ym + p(3,1) , p(4,1)*xm + (1+p(5,1))*ym + p(6,1));

gx_warp = imwarp(gx,tform,'OutputView',imref2d(size(It)));
gy_warp = imwarp(gy,tform,'OutputView',imref2d(size(It)));

gx1=gx_warp(:);
gy1=gy_warp(:);
G(:,1)=gx1;
G(:,2)=gy1;

H1=[xm(:).*G(:,1) ym(:).*G(:,1) G(:,1) xm(:).*G(:,2) ym(:).*G(:,2) G(:,2)];

%H1=G*J;
H2=H1';
H=H2*H1;

error=error(:);
Sum=H2*error;

Hinverse=inv(H);
p_del=Hinverse*Sum;
% u_del=p_del(1,1);
% v_del=p_del(2,1);
% p=[u+u_del,v+v_del];

% u=p(1,1);
% v=p(1,2);
p=p+p_del;
M=[1+p(1,:) p(2,:) p(3,:); p(4,:) 1+p(5,:) p(6,:); 0 0 1];

end

% imshow(It1);
% figure
% imshow(It1_warp);
% rectangle('Position',[x1+u,y1+v,w,h],'EdgeColor','r');
% drawnow;

end

