function file_rename(x)
%功能：对所需文件夹及其子文件中的csv文件重命名——由- NO.*-R0.csv 到NO_*_R0.csv
%
%输入：
%      x:需要重命名文件夹所在绝对路径


data_csv = dir(strcat(x,'\','**/*.csv'));%获取所有csv文件
data_csv = struct2cell(data_csv)';

%将新的名字存储到data_name
data_name = {};
for i = 1 : length(data_csv)
    data_name{i,1} = split(data_csv{i,1},".");
    data_name{i,1} = join(data_name{i,1}(1:2),'.');
    data_name{i,1} = replace(data_name{i,1},{'.','-'},{'_','_'});
    data_name{i,1} = strcat(data_name{i,1},'.csv');
end

%获取csv文件的完整路径，便于进行movefile操作
new_path = {};
for i = 1 : length(data_csv)
    new_path{i,1} = strcat(data_csv{i,2},'\',data_csv{i,1});
end
new_path = cell2str(new_path,1); %调用cell2str函数，将cell转化为string
data_name = cell2str(data_name,1);
%对文件进行重命名
for i = 1 : length(data_csv)
    movefile(new_path(i,1),strcat(data_csv{i,2},'\',data_name(i,1)));
end
end

function y = cell2str(x,position)

%功能：将cell中的元素转换为string
%
%输入参数：
%         x：待转化的元胞数组；
%         position:待转化元素所在的列的位置

y = strings(length(x),1);
for i = 1 : length(x)
    y(i,1) = x{i,position};
end
end


