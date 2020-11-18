%功能：将文件夹x及其子文件中的csv文件读入matlab工作区中，并以文件名（不带文件
%      扩展名）作为变量名。
%x:文件夹的绝对路径

file_csv = dir(strcat(x,'**/*.csv'));
file_csv = struct2cell(file_csv)';
filename = file_csv(:,1);
filename = cell2str(filename,1);
AP = {}; %csv文件的绝对路径
for i = 1 : length(file_csv)
    AP{i,1} = strcat(file_csv{i,2},'\',filename(i,1));
    [filepath,name,ext] = fileparts(AP{i,1});
    var = char(name);
    str = sprintf("%s=readtable(AP{i,1});",var);
    eval(str); %将字符串转化为变量   
end

function y = cell2str(x,position)

%功能：将cell中的元素转换为string%
%输入参数：
%         x：待转化的元胞数组；
%         position:待转化元素所在的列的位置

y = strings(length(x),1);
for i = 1 : length(x)
    y(i,1) = x{i,position};
end


end
clearvars -except -regexp 0$;