%���ܣ����ļ���x�������ļ��е�csv�ļ�����matlab�������У������ļ����������ļ�
%      ��չ������Ϊ��������
%x:�ļ��еľ���·��

file_csv = dir(strcat(x,'**/*.csv'));
file_csv = struct2cell(file_csv)';
filename = file_csv(:,1);
filename = cell2str(filename,1);
AP = {}; %csv�ļ��ľ���·��
for i = 1 : length(file_csv)
    AP{i,1} = strcat(file_csv{i,2},'\',filename(i,1));
    [filepath,name,ext] = fileparts(AP{i,1});
    var = char(name);
    str = sprintf("%s=readtable(AP{i,1});",var);
    eval(str); %���ַ���ת��Ϊ����   
end

function y = cell2str(x,position)

%���ܣ���cell�е�Ԫ��ת��Ϊstring%
%���������
%         x����ת����Ԫ�����飻
%         position:��ת��Ԫ�����ڵ��е�λ��

y = strings(length(x),1);
for i = 1 : length(x)
    y(i,1) = x{i,position};
end


end
clearvars -except -regexp 0$;