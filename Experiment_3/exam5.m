clear;clc;

%��5���c��
X=zuoye5_a(10^6);     %����10^6�������㣬ÿһ����һ��6ά������
Xt=zuoye5_a(100);     %����100�����Լ�
D=size(X,2);N=size(X,1);Nt=size(Xt,1);  
for j=1:Nt            %������Щ���Լ�
    min_dis=100000;  
    for i=1:N  
        dis=norm(X(i,:)-Xt(j,:));  
        if dis<min_dis  
            min_dis=dis;  
            neighbor(j)=i;  
        end  
    end  
end  

%��5���4��
res = zeros(1,D);
Nm = N;
for d=1:D  
    for j=1:Nt  
        m_d=1e300;  
        for i=1:Nm  
            dis=norm(X(i,1:d)-Xt(j,1:d));  
            if dis<m_d  
                m_d=dis;  
                neighbor1(d,j)=i;  
%                 Xt_c1(j)=X_c(i);  
            end  
        end  
        if neighbor1(d,j)==neighbor(j)  
            res(d)=res(d)+1;  
        end  
    end  
end  
plot(1:d,res(1:d)/Nt);  
