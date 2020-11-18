function [out_data1, out_data2] = exdata(sec_list, matrix_name)
%%
%??ͨ����sec_list�е�matrix_name�����������ݵ���ȡ
%����
% sec_list:��Ҫ��ȡ��ʱ��Σ�����Ϊn*2�ľ��� [start_time end_time] ʱ���ʽΪ���������
% matrix_name:�������Ҫ��������� table  [seq time temperature radio_heat]
%���
% out_data: ���������Ϊ��ȡ���table
% data_name = who; %�ҵ���ǰworkspace��������Щ
%%
%�жϱ����Ƿ�����ڹ�����
% disp(matrix_name);
% if exist(matrix_name)==0
%     str = sprintf("var %s is not exist",matrix_name);
%     disp(str);
% end
%%
% ��ȡʱ������
% var_data = eval(matrix_name);
var_data = evalin('base', matrix_name);% ��ȡ���������
get_time_data = var_data{:,2}(:); %���ʱ������
%
%��ȡ����sec_list�е��ҵ�startʱ���Ӧ��index
%seq_index:���ڴ洢��Ӧʱ�俪ʼ�ͽ���������
seq_index = [];
for i = 1:size(sec_list,1)
    start_index = min(find(abs(get_time_data-sec_list(i,1))==min(abs(get_time_data-sec_list(i,1)))));
    %�ҵ�endʱ���Ӧ��index
    end_index = max(find(abs(get_time_data-sec_list(i,2))==min(abs(get_time_data-sec_list(i,2)))));
    seq_index(i,:) = [start_index end_index];
end
%׼���������
rowout_size = max(seq_index(:,2)-seq_index(:,1)) + 1; %�涨�������Ĵ�С
out_data1 = zeros(rowout_size,size(sec_list,1));
out_data2 = zeros(rowout_size,size(sec_list,1));
for i = 1:size(sec_list,1)
    out_data1(1:size(var_data{:,3}(seq_index(i,1):seq_index(i,2))',2),i) = var_data{:,3}(seq_index(i,1):seq_index(i,2))';
    out_data2(1:size(var_data{:,4}(seq_index(i,1):seq_index(i,2))',2),i) = var_data{:,4}(seq_index(i,1):seq_index(i,2))';
end
end
