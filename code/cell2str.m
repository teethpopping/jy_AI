function y = cell2str(x,position)

%���ܣ���cell�е�Ԫ��ת��Ϊstring
%
%���������
%         x����ת����Ԫ�����飻
%         position:��ת��Ԫ�����ڵ��е�λ��

y = strings(length(x),1);
for i = 1 : length(x)
    y(i,1) = x{i,position};
end