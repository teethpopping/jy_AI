function file_rename(x)
%功能：对所需文件夹及其子文件中的csv文件重命名——由- NO.*-R0.csv 到NO_*_R0.csv
%
%输入参数x：文件夹的绝对路径

%x = 'F:\download\Matlab R2019b\bin\MATLAB_scripts\JY实验室\task1\火灾2\';
data_csv = dir(strcat(x,'**/*.csv'));%获取所有csv文件
data_csv = struct2cell(data_csv)';
new_path = {};
for i = 1 : length(data_csv)
    new_path{i,1} = strcat(data_csv{i,2},'\',data_csv{i,1});
end
%将新的名字存储到data_name
data_name = {};
for i = 1 : length(data_csv)
    [filepath,name,ext] = fileparts(new_path{i,1});
    data_name{i,1} = name;
    data_name{i,1} = split(data_name{i,1},[".","-"]);
    if length(data_name{i,1}) == 3
        num_str = cell2str(data_name{i,1}(2),1);
        num_char = convertStringsToChars(num_str);
        %判断数字是否是一位数。如果是数字前加0
        if length(num_char) == 1
            data_name{i,1} = strcat(data_name{i,1}(1),'_','0',data_name{i,1}(2),'_',data_name{i,1}(3));
        else
            data_name{i,1} = join(data_name{i,1}(1:end),'.');
            data_name{i,1} = replace(data_name{i,1},{'.','-'},{'_','_'});
        end
    
        
        
    end
    data_name{i,1} = strcat(data_name{i,1},'.csv');
    
end

new_path = cell2str(new_path,1); %调用cell2str函数，将cell转化为string
data_name = cell2str(data_name,1);

%运行一次代码以后，文件夹已经重命名了，...若运行多次，将会判断是否已经修改果，若已经修改好，则不执行重命名操作
for i = 1 : length(data_csv)
    if new_path(i,1) ~= strcat(data_csv{i,2},'\',data_name(i,1)) 
        movefile(new_path(i,1),strcat(data_csv{i,2},'\',data_name(i,1)));
    end
end



end
