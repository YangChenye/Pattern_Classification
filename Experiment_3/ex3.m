% x=unifrnd(-1/2,1/2,1,10000);
% y=unifrnd(-1/2,1/2,1,10000);
% z=unifrnd(-1/2,1/2,1,10000);
% plot3(x,y,z,'r.')

% x=unifrnd(-1/2,1/2,1,10000);
% y=unifrnd(-1/2,1/2,1,10000);
% z=unifrnd(-1/2,1/2,1,10000);
% n=10000;
% p=[];
% t=[];
% h=0:0.001:1;
% for h=0:0.001:1
%     m=0;
%     for i=1:10000
%         if (abs(x(i))<(1/2*h))&(abs(y(i))<(1/2*h))&(abs(z(i))<(1/2*h))
%             m=m+1;
%         end
%     end
%     t=[t;h];
%     k=m/(n*(h^3));
%     p=[p;k];
% end
% plot(t,p)
% xlabel('h')
% ylabel('概率密度p')

% k=1:10000;
% n=10000;
% x=[];
% y=[];
% for k=1:10000
%     x=[x;k];
%     p=(1/n)/(1/sqrt(k));
%     y=[y;p];
% end
% plot(x,y)
% xlabel('n')
% ylabel('概率密度p')

% N=10000
% ang1=rand(1,N)*2*pi;%随机10000个0~2pi高斯分布的角度1
% ang2=acos(rand(1,N)*2-1);%随机10000个-1~1高斯分布的反余弦获得角度2
% r=rand(1,N).^(1/3);%随机10000个0~1高斯分布数的开立方为到原点距离
% x=r.*cos(ang1).*sin(ang2);% x
% y=r.*sin(ang1).*sin(ang2);% y
% z=r.*cos(ang2);% z
% figure(1)
% plot3(x,y,z,'r.');
% grid on;
% axis square;
% n=10000;
% p=[];
% t=[];
% h=0:0.001:1;
% for h=0:0.001:1
%     m=0;
%     for i=1:10000
%         if (abs(x(i))<(1/2*h))&(abs(y(i))<(1/2*h))&(abs(z(i))<(1/2*h))
%             m=m+1;
%         end
%     end
%     t=[t;h];
%     k=m/(n*(h^3));
%     p=[p;k];
% end
% figure(2)
% plot(t,p)
% xlabel('h')
% ylabel('概率密度p')
%  
% k=1:10000;
% n=10000;
% x=[];
% y=[];
% for k=1:10000
%     x=[x;k];
%     p=1/n/(1/sqrt(k));
%     y=[y;p];
% end
% figure(3)
% plot(x,y)
% xlabel('n')
% ylabel('概率密度p')

% w1(:,:,1) = [ 0.28  1.31  -6.2;...
%              0.07  0.58  -0.78;...
%              1.54  2.01  -1.63;...
%             -0.44  1.18  -4.32;...
%             -0.81  0.21   5.73;...
%              1.52  3.16   2.77;...
%              2.20  2.42  -0.19;...
%              0.91  1.94   6.21;...
%              0.65  1.93   4.38;...
%             -0.26  0.82  -0.96];
%  
% w1(:,:,2) = [0.011  1.03  -0.21;...
%              1.27  1.28   0.08;...
%              0.13  3.12   0.16;...
%             -0.21  1.23  -0.11;...
%             -2.18  1.39  -0.19;...
%              0.34  1.96  -0.16;...
%             -1.38  0.94   0.45;...
%             -0.12  0.82   0.17;...
%             -1.44  2.31   0.14;...
%              0.26  1.94   0.08];
%  
% w1(:,:,3) = [ 1.36  2.17  0.14;...
%              1.41  1.45 -0.38;...
%              1.22  0.99  0.69;...
%              2.46  2.19  1.31;...
%              0.68  0.79  0.87;...
%              2.51  3.22  1.35;...
%              0.60  2.44  0.92;...
%              0.64  0.13  0.97;...
%              0.85  0.58  0.99;...
%              0.66  0.51  0.88];
% x=zeros(3,3);
% x(1,:) = [0.5 1 0];
% x(2,:) = [0.31 1.51 -0.5];
% x(3,:) = [-0.3 0.44 -0.1];
%  
% h =1; %重要参数
%  
% p = Parzen(w1,x(1,:),h);
% num = find(p == max(p));
% disp(['点：[',num2str(x(1,:)),']落在三个类别的概率分别为：',num2str(p)]);
% disp(['点：[',num2str(x(1,:)),']落在第',num2str(num),'类']);
% p = Parzen(w1,x(2,:),h);
% num = find(p == max(p));
% disp(['点：[',num2str(x(2,:)),']落在三个类别的概率分别为：',num2str(p)]);
% disp(['点：[',num2str(x(2,:)),']落在第',num2str(num),'类']);
% p = Parzen(w1,x(3,:),h);
% num = find(p == max(p));
% disp(['点：[',num2str(x(3,:)),']落在三个类别的概率分别为：',num2str(p)]);
% disp(['点：[',num2str(x(3,:)),']落在第',num2str(num),'类']);


% w1= [ 0.28  1.31  -6.2;...
%              0.07  0.58  -0.78;...
%              1.54  2.01  -1.63;...
%             -0.44  1.18  -4.32;...
%             -0.81  0.21   5.73;...
%              1.52  3.16   2.77;...
%              2.20  2.42  -0.19;...
%              0.91  1.94   6.21;...
%              0.65  1.93   4.38;...
%             -0.26  0.82  -0.96];
%  
% w2 = [0.011  1.03  -0.21;...
%              1.27  1.28   0.08;...
%              0.13  3.12   0.16;...
%             -0.21  1.23  -0.11;...
%             -2.18  1.39  -0.19;...
%              0.34  1.96  -0.16;...
%             -1.38  0.94   0.45;...
%             -0.12  0.82   0.17;...
%             -1.44  2.31   0.14;...
%              0.26  1.94   0.08];
%  
% w3 = [ 1.36  2.17  0.14;...
%              1.41  1.45 -0.38;...
%              1.22  0.99  0.69;...
%              2.46  2.19  1.31;...
%              0.68  0.79  0.87;...
%              2.51  3.22  1.35;...
%              0.60  2.44  0.92;...
%              0.64  0.13  0.97;...
%              0.85  0.58  0.99;...
%              0.66  0.51  0.88];

% 
% a1=w3(:,1);
% N=100;
% b=2*rand(N,1);  
% k1=1;k2=3;k3=5;
% p1=kneighbor(a1,k1,b);
% p2=kneighbor(a1,k2,b);
% p3=kneighbor(a1,k3,b);
% figure(1);
% subplot(1,4,1);
% plot(b,p1,'.');
% subplot(1,4,2);
% plot(b,p2,'.');
% subplot(1,4,3);
% plot(b,p3,'.');

% b1=[];
% a2=w2(:,1);
% a3=w2(:,2);
% b1=[a2 a3];
% N=100;
% b2=3*rand(N,2);   
% k1=1;k2=3;k3=5;
% p11=kneighbor(b1,k1,b2);
% p12=kneighbor(b1,k2,b2);
% p13=kneighbor(b1,k3,b2);
% data1=[b2 p11];
% figure(2);
% plot3(b2(:,1),b2(:,2),p11,'.');
% grid on;
% figure(3);
% plot3(b2(:,1),b2(:,2),p12,'.');
% grid on;
% figure(4);
% plot3(b2(:,1),b2(:,2),p13,'.');
% grid on;

% b3=[-0.41,0.82,0.88;0.14,0.72,4.1;-0.81,0.61,-0.38];   
% k=1;
% p21=kneighbor(w1,k,b3);
% p22=kneighbor(w2,k,b3);
% p23=kneighbor(w3,k,b3);
% disp(['w1的概率密度分别为： ',num2str(p21(1)), ' ', num2str(p21(2)), ' ' , num2str(p21(3))]);
% disp(['w2的概率密度分别为： ',num2str(p22(1)), ' ', num2str(p22(2)), ' ' , num2str(p22(3))]);
% disp(['w3的概率密度分别为： ',num2str(p23(1)), ' ', num2str(p23(2)), ' ',  num2str(p23(3))]);


% clear;clc;
% % pic_rgb = imread('4.png');
% % pic_gray = rgb2gray(pic_rgb);
% pic_gray = imread('7.png');
% pic_re = imresize(pic_gray, [10, 10]);
% vector = pic_re(:);
% max = 20;
% for x=0:1:max
%     pic_re_trans = zeros(10, 10);
%     if x<= 9
%         pic_re_trans(:, 1+x:10) = pic_re(:, 1:10-x);
%     end
%     vector_trans = pic_re_trans(:);
%     y(x+1) = sqrt(sum((vector_trans - double(vector)).^2));
% end
% x = 0:1:max;
% plot(x, y)

% d = 6;
% X = unifrnd(-1/2,1/2,1e4,d);    %prototypes
% Xt = unifrnd(-1/2,1/2,100,d);   %test set
% 
% D=size(X,2);N=size(X,1);Nt=size(Xt,1);  
% for j=1:Nt  
%     min_dis=1e300;  
%     for i=1:N  
%         dis=norm(X(i,:)-Xt(j,:));  
%         if dis<min_dis  
%             min_dis=dis;  
%             neighbor(j)=i;  
%             Xt(j)=X(i);  
%         end  
%     end  
% end
% 
% 
% D=size(X,2);Nm=size(X,1);Ntt=size(Xt,1);  
% res=zeros(1,D);  
% for d=1:D  
%     for j=1:Nt  
%         min_dis=1e300;  
%         for i=1:Nm  
%             dis=norm(X(i,1:d)-Xt(j,1:d));  
%             if dis<m_d  
%                 m_d=dis;  
%                 neighbor1(d,j)=i;  
%                 Xt_c1(j)=X_c(i);  
%             end  
%         end  
%         if neighbor1(d,j)==neighbor(j)  
%             res(d)=res(d)+1;  
%         end  
%     end  
% end  
% plot(1:d,res(1:d)/Nt);  

function [class]=ce6_a(k,p)  
C=3;D=3;N=10;  
min_dis=1e4;  
for c=1:C  
    for i=1:N  
        if k==inf  
            dis=max(abs(x(c,i,1)-p(1)),max(abs(x(c,i,2)-p(2)),abs(x(c,i,3)-p(3))));  
        else  
            dis=(abs(x(c,i,1)-p(1)).^k+abs(x(c,i,2)-p(2)).^k+abs(x(c,i,3)-p(3)).^k).^(1/k);  
        end  
        if dis<m_d  
            m_d=dis;  
            neighbor=x(c,i,:);  
            class=c;  
        end  
    end  
end

