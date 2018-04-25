function [solution iter] = SinglePerceptron(Y,tau)
%
%   solution = SinglePerceptron(Y,tau) 固定增量单样本感知器算法实现
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

theta = 0.001;                  %阈值
change = 100;                   %每一次迭代对权向量的改变量
                                %为了让循环开始，随便赋个值
error_number = 20;              %分错的样本数
                                %为了让循环开始，随便赋个值

while ((k<k_max) & (error_number>0))
    y_error = [];                           %被分错的样本集，注意每次迭代都要初始化
    %与批处理不同的是，这里的被分错的样本机仅仅用来统计所有的样本中被分错的
    %对权向量的更新不起任何作用
    %就是说每走一个样本，权向量都有可能更新，被分错的样本会被记录
    %所有的样本都被分对意味着走完所有的样本，没有样本被添加进y_error[]
    
    for i=1:y_k                             %扫一遍样本集中的每一个样本
        if (a*(Y(i,:)')<tau)                %如果扫过的这个样本被分错
            y_error = [y_error;Y(i,:)];     %记录出错的样本
            change = eta*Y(i,:);
            a = a+change;                   %修改权向量
        end
        k = k+1;                            %不管扫过的这个样本有没有出错，迭代次数加一
    end
    
    [error_number, ~] = size(y_error);      %被分错的数量
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = k_max;
solution = a;
iter = k-1;
