function read_work(x)

%���ܣ����ļ���x�������ļ��е�csv�ļ�����matlab�������У������ļ����������ļ�
%      ��չ������Ϊ��������

file_csv = dir(strcat(x,'**/*.csv'));
file_csv = struct2cell(file_csv)';
filename = file_csv(:,1);
filename = cell2str(filename,1);
AP = {}; %csv�ļ��ľ���·��
for i = 1 : length(file_csv)
    AP{i,1} = strcat(file_csv{i,2},'\',filename(i,1));
    [filepath,name,ext] = fileparts(AP{i,1});
    var = char(name);
    eval([var, '= readtable(AP{i,1});']); %���ַ���ת��Ϊ����   
end

end