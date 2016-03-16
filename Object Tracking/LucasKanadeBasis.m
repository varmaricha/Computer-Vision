function [u,v] = LucasKanadeBasis(It, It1, rect, bases)

rect=rect';
x1=rect(1,:);
y1=rect(2,:);
w=rect(3,:)-rect(1,:)+1;
h=rect(4,:)-rect(2,:)+1;
w=uint8(w);
h=uint8(h);
J=[1 0; 0 1];
u=0;
v=0;
p_del=1;
thres=0.020;
weight=zeros(10,1);
add_error=zeros(h,w);

p=[u,v]';
p=[1 0 0;0 1 0;u v 1];
It1= im2double(It1);
It= im2double(It);

template=It(rect(2,:):rect(4,:),rect(1,:):rect(3,:));
[xm,ym]=meshgrid(rect(1,:):rect(3,:),rect(2,:):rect(4,:));


while(norm(p_del)>thres)

It1_interp = interp2(It1,xm+u,ym+v);
    
for i=1:10
    basisvect=bases(:,:,i);
    basisvect=basisvect(:)';
    
weight(i,1)=basisvect*It1_interp(:);
end

weight=weight/sum(weight);

for j=1:10
    prod=weight(i,1).*bases(:,:,i);
    add_error=add_error+prod;
end

error=(template+add_error)-It1_interp;

[gx,gy]=imgradientxy(It1);
gx_interp = interp2(gx,xm+u,ym+v);
gy_interp = interp2(gy,xm+u,ym+v);


gx1=gx_interp(:);
gy1=gy_interp(:);
G(:,1)=gx1;
G(:,2)=gy1;

H1=G*J;
H2=H1';
H=H2*H1;

error=error(:);
Sum=H2*error;

Hinverse=inv(H);
p_del=Hinverse*Sum;
u_del=p_del(1,1);
v_del=p_del(2,1);
p=[u+u_del,v+v_del];

u=p(1,1);
%disp(u);
v=p(1,2);
%disp(v);


end

imshow(It1);
rectangle('Position',[x1+u,y1+v,w,h],'EdgeColor','b');
drawnow;

end

