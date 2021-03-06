function [solution iter] = Widrow_Hoff(Y,stepsize)
%
%    solution = Widrow_Hoff(Y.tau)最小均方差实现算法
%
%   输入：规范化样本矩阵Y,裕量tau,初始步长stepsize
%   输出：解向量solution，迭代次数iter
%
[y_k, d] = size(Y);             %y_k样本数 d样本维数
a = zeros(1,d);                 %增广权向量
k_max = 10000;                  %最大迭代次数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 1;                          %迭代次数
eta0 = stepsize;                %初始学习率
tau = 1;                        %这个函数没有定义裕量，在这里定义
%如果样本的不同维对应的裕量不同，可以通过向量的形式定义这个裕量

theta = 0.001;                  %阈值
change = 100;                   %每一次迭代对增广权向量的改变量
                                %为了让循环开始，随便赋个值

while ((k<k_max) & (norm(change)>=theta))
    
    which_sample = mod(k,y_k);  %在本次迭代中，使用哪一个样本来进行运算
    if (which_sample == 0)      %当k=y_k时，mod为0，需要重新赋值
        which_sample = y_k;
    end
    
    change = (eta0/k)*(tau-a*(Y(which_sample,:)'))*Y(which_sample,:);
    
    a = a+change;                %修改权向量
    k = k+1;                     %迭代次数加一
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = k_max;
solution = a;
iter = k-1;