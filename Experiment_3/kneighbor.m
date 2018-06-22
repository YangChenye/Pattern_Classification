function [ px ] = kneighbor( a, kn, x )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[m, n] = size(a);
b = x;
N = 100;
if n == 1                             
    px = zeros(N,1);
    vn1 = zeros(N,1);
    for i = 1:N
        for j = 1:m
            vn1(j) = abs(b(i) - a(j)); 
        end
        vn1 = sort(vn1);             
        px(i) = kn / N / (vn1(kn));   
    end
end
    
if n == 2                             
    px = zeros(N,1);                
    vn2 = zeros(N,1);
    for i = 1:N
        for j = 1:m
            vn2(j) = sqrt((b(i,1)-a(j,1))^2+(b(i,2)-a(j,2))^2);  
        end
        vn2 = sort(vn2);
        px(i) = kn/N/(vn2(kn));
    end
end
    
if n == 3                             
    px = zeros(3,1);                
    vn3 = zeros(3,1);
    for i = 1:3
        for j = 1:m
            vn3(j) = sqrt((b(i,1)-a(j,1))^2+(b(i,2)-a(j,2))^2+(b(i,3)-a(j,3))^2);  
        end
        vn3 = sort(vn3);
        px(i) = kn/3/(vn3(kn));
    end
end

end

