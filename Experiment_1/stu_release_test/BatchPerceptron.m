function [solution iter] = BatchPerceptron(Y,tau)
%
%   solution = BatchPerceptron(Y,tau) �̶������������֪���㷨ʵ��
%
%   ���룺�淶����������Y,ԣ��tau
%   �����������solution����������iter
%
[y_k, d] = size(Y);             %y_k������ d����ά��
a = zeros(1,d);                 %Ȩ����
k_max = 10000;                  %����������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 1;                          %��������
eta = 1;                        %ѧϰ��

theta = 0.001;                  %׼��
change = 100;                   %ÿһ�ε�����Ȩ�����ĸı���
                                %Ϊ����ѭ����ʼ����㸳��ֵ

while ((k<k_max) & (norm(change)>=theta))
    y_error = [];                           %���ִ����������ע��ÿ�ε�����Ҫ��ʼ��
    for i=1:y_k                             %�ҵ����б�a_k�ִ������
        if (a*(Y(i,:)')<tau)
            y_error = [y_error;Y(i,:)];     %���д洢��y_error��
        end
    end
    
    [error_number, ~] = size(y_error);      %���ִ������
    
    if (error_number > 1)                   %���������������������ִ��ʱ��
        for i=2:1:error_number              %�����б��ִ�������ĺͣ��������洢�ڵ�һ�����ִ��������
            y_error(1,:) = y_error(1,:)+y_error(i,:);
        end
        change = eta*y_error(1,:);          %ÿһ�ε�����Ȩ�����ĸı���
    elseif (error_number == 1)              %ֻ��һ���������ִ������
        change = eta*y_error(1,:);          %ÿһ�ε�����Ȩ�����ĸı���Ϊ��һ��
    else                                    %û���������ִ�
        change = 0;                         %ÿһ�ε�����Ȩ�����ĸı���Ϊ0
    end
    a = a+change;                           %�޸�Ȩ����
    k = k+1;                                %����������һ
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = k_max;
solution = a;
iter = k-1;
