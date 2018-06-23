clear;clc;
load('dataset.mat');
x=[w1(:,1);w3(:,1)];   %将w1和w3的x1坐标设为一个变量
y=[w1(:,2);w3(:,2)];   %将w1和w3的x2坐标设为一个变量
N=10;k=4;  
%c问
[u,v]=voronoi(x,y);  %画Voronoi的图像，[vx,vy]里面存的是边的有限顶点
f1=figure();
plot(w1(:,1),w1(:,2),'r*',w3(:,1),w3(:,2),'b.',u,v,'b-')
xlim([min(x) max(x)])
ylim([min(y) max(y)])

%d问
f2=figure();
[vx,vy]=voronoi(x,y);  
k=0;  
threshold=1e-3;  
for i=1:size(vx,2)  
    i;  
    flag=1;  
    for j=1:2*N  
        [sx,sy]=find_symmetry_p(x(j),y(j),vx(1,i),vy(1,i),vx(2,i),vy(2,i));  
        kx=find(abs(x-sx)<threshold);  
        ky=find(abs(y-sy)<threshold);  
        if kx==ky & kx~=j & ((0<kx && kx<=N && 0<j && j<=N) || (N<kx && kx<=2*N && N<j && j<=2*N))  
            i; 
            kx;
            flag=0;  
            break;  
        end  
    end  
    if flag==1  
        k=k+1;  
        ux(:,k)=vx(:,i);  
        uy(:,k)=vy(:,i);  
    end  
end  
plot(x(1:N),y(1:N),'r+',x(N+1:2*N),y(N+1:2*N),'b*',ux,uy,'b-');  
axis([-1 3 -1 4]);  

%e问
f3=figure();
d=zeros(2*N,2*N);  
for i=1:2*N  
    for j=i:2*N  
        d(j,i)=(x(i)-x(j)).^2+(y(i)-y(j)).^2;  
        d(i,j)=d(j,i);  
    end  
end  
m=0;  
hold on;  
for i=1:2*N  
    flag1=0;  
    flag=ones(1,2*N);  
    flag(i)=0;  
    for j=1:k  
        min_d=1e4;  
        for l=1:2*N  
            if flag(l)==0  
                continue;  
            end  
            if d(i,l)<min_d  
                q=l;  
                min_d=d(i,l);  
            end  
        end  
        flag(q)=0;  
        if (q>N && i<=N) || (q<=N && i>N)  
            flag1=1;  
            break;  
        end  
    end  
    if flag1==1  
        m=m+1;  
        zuoye(m)=x(i);  
        ey(m)=y(i);  
        if i<=N  
            plot(zuoye(m),ey(m),'r*');  
            class(m)=0;  
        else  
            plot(zuoye(m),ey(m),'b*');  
            class(m)=1;  
        end  
    end  
end  
plot(x(1:N),y(1:N),'r.',x(N+1:2*N),y(N+1:2*N),'b.');  

%f问
f4=figure();
voronoi(zuoye,ey);  
hold on;  
plot(x(1:N),y(1:N),'r.',x(N+1:2*N),y(N+1:2*N),'b.');  
for i=1:length(zuoye)  
    if class(i)==0  
        plot(zuoye(i),ey(i),'r*');  
    else  
        plot(zuoye(i),ey(i),'b*');  
    end  
end 

