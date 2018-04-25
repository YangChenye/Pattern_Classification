function Y = StandardSample(X1,X2)
%
%    Y = StandardSample(X1,X2)�淶��������������淶��������������
%
%    ���룺��������X1��X2����Ϊdά����������
%    ������淶��������������Y
%
%    ��X1ΪN-Dά��������๲��N����������X2ΪM-Dά��������๲��M��������
%    ��������M+N����������ô�����YΪ(M+N)-(D+1)ά����
%

[su_x1,sv_x1] = size(X1);
[su_x2,sv_x2] = size(X2);

if sv_x1~=sv_x2
    error('two input matrixs must have same columns');
end

I_x1 = ones(su_x1,1);
I_x2 = ones(su_x2,1);

Y1 = [I_x1,X1];
Y2 = [I_x2,X2];

Y = [Y1;-Y2];