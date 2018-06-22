function [ p ] = Parzen( w,x,h )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[xt,yt,zt] = size(w);
 
p = zeros(1,zt);
 
for i = 1:zt
    hn = h;
    for j = 1:xt
        hn = hn / sqrt(j);
        p(i) = p(i) + exp(-(x - w(j,:,i))*(x - w(j,:,i))'/ (2 * power(hn,2))) / (hn * sqrt(2*3.14));
    end
    p(i) = p(i) / xt;
end

end

