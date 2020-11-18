function read_work(x)

%功能：将文件夹x及其子文件中的csv文件读入matlab工作区中，并以文件名（不带文件
%      扩展名）作为变量名。

file_csv = dir(strcat(x,'**/*.csv'));
file_csv = struct2cell(file_csv)';
filename = file_csv(:,1);
filename = cell2str(filename,1);
AP = {}; %csv文件的绝对路径
for i = 1 : length(file_csv)
    AP{i,1} = strcat(file_csv{i,2},'\',filename(i,1));
    [filepath,name,ext] = fileparts(AP{i,1});
    var = char(name);
    eval([var, '= readtable(AP{i,1});']); %将字符串转化为变量   
end

end