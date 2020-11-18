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