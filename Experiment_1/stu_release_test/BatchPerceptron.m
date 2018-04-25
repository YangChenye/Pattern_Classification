function [solution iter] = BatchPerceptron(Y,tau)
%
%   solution = BatchPerceptron(Y,tau) 固定增量批处理感知器算法实现
%
%   输入：规范化样本矩阵Y,裕量tau
%   输出：解向量solution，迭代次数iter
%
[y_k, d] = size(Y);             %y_k样本数 d样本维数
a = zeros(1,d);                 %权向量
k_max = 10000;                  %最大迭代次数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 1;                          %迭代次数
eta = 1;                        %学习率

theta = 0.001;                  %准则
change = 100;                   %每一次迭代对权向量的改变量
                                %为了让循环开始，随便赋个值

while ((k<k_max) & (norm(change)>=theta))
    y_error = [];                           %被分错的样本集，注意每次迭代都要初始化
    for i=1:y_k                             %找到所有被a_k分错的样本
        if (a*(Y(i,:)')<tau)
            y_error = [y_error;Y(i,:)];     %按行存储在y_error中
        end
    end
    
    [error_number, ~] = size(y_error);      %被分错的数量
    
    if (error_number > 1)                   %当有两个及以上样本被分错的时候
        for i=2:1:error_number              %求所有被分错的向量的和，并把它存储在第一个被分错的向量中
            y_error(1,:) = y_error(1,:)+y_error(i,:);
        end
        change = eta*y_error(1,:);          %每一次迭代对权向量的改变量
    elseif (error_number == 1)              %只有一个样本被分错不用求和
        change = eta*y_error(1,:);          %每一次迭代对权向量的改变量为第一行
    else                                    %没有样本被分错
        change = 0;                         %每一次迭代对权向量的改变量为0
    end
    a = a+change;                           %修改权向量
    k = k+1;                                %迭代次数加一
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = k_max;
solution = a;
iter = k-1;
