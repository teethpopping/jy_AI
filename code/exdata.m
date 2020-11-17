function [out_data1, out_data2] = exdata(sec_list, matrix_name)
%%
%??通过对sec_list中的matrix_name变量进行数据的提取
%输入
% sec_list:需要截取的时间段，可以为n*2的矩阵 [start_time end_time] 时间格式为当天的秒数
% matrix_name:输入的需要处理的数据 table  [seq time temperature radio_heat]
%输出
% out_data: 输出的数据为截取后的table
% data_name = who; %找到当前workspace里面有哪些
%%
%判断变量是否存在于工作区
% disp(matrix_name);
% if exist(matrix_name)==0
%     str = sprintf("var %s is not exist",matrix_name);
%     disp(str);
% end
%%
% 获取时间数据
% var_data = eval(matrix_name);
var_data = evalin('base', matrix_name);% 获取传入的数据
get_time_data = var_data{:,2}(:); %获得时间数据
%
%获取所有sec_list中的找到start时间对应的index
%seq_index:用于存储对应时间开始和结束的序列
seq_index = [];
for i = 1:size(sec_list,1)
    start_index = min(find(abs(get_time_data-sec_list(i,1))==min(abs(get_time_data-sec_list(i,1)))));
    %找到end时间对应的index
    end_index = max(find(abs(get_time_data-sec_list(i,2))==min(abs(get_time_data-sec_list(i,2)))));
    seq_index(i,:) = [start_index end_index];
end
%准备输出数据
rowout_size = max(seq_index(:,2)-seq_index(:,1)) + 1; %规定输出矩阵的大小
out_data1 = zeros(rowout_size,size(sec_list,1));
out_data2 = zeros(rowout_size,size(sec_list,1));
for i = 1:size(sec_list,1)
    out_data1(1:size(var_data{:,3}(seq_index(i,1):seq_index(i,2))',2),i) = var_data{:,3}(seq_index(i,1):seq_index(i,2))';
    out_data2(1:size(var_data{:,4}(seq_index(i,1):seq_index(i,2))',2),i) = var_data{:,4}(seq_index(i,1):seq_index(i,2))';
end
end
