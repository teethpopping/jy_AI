function file_rename(x)
%���ܣ��������ļ��м������ļ��е�csv�ļ�������������- NO.*-R0.csv ��NO_*_R0.csv
%
%���룺
%      x:��Ҫ�������ļ������ھ���·��


data_csv = dir(strcat(x,'\','**/*.csv'));%��ȡ����csv�ļ�
data_csv = struct2cell(data_csv)';

%���µ����ִ洢��data_name
data_name = {};
for i = 1 : length(data_csv)
    data_name{i,1} = split(data_csv{i,1},".");
    data_name{i,1} = join(data_name{i,1}(1:2),'.');
    data_name{i,1} = replace(data_name{i,1},{'.','-'},{'_','_'});
    data_name{i,1} = strcat(data_name{i,1},'.csv');
end

%��ȡcsv�ļ�������·�������ڽ���movefile����
new_path = {};
for i = 1 : length(data_csv)
    new_path{i,1} = strcat(data_csv{i,2},'\',data_csv{i,1});
end
new_path = cell2str(new_path,1); %����cell2str��������cellת��Ϊstring
data_name = cell2str(data_name,1);
%���ļ�����������
for i = 1 : length(data_csv)
    movefile(new_path(i,1),strcat(data_csv{i,2},'\',data_name(i,1)));
end
end

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
end


