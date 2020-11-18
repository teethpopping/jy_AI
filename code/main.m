%%
%github ��ַ https://github.com/teethpopping/jy_AI/tree/fire_data
%%
clc
clear
%%
%�ļ�������
path = 'F:\matlab\jyʵ����\fcs\git_fier_data\code\ʵ������\';
file_rename(path)
disp('�ļ����������')
%%
%�ļ���ȡ
file_csv = dir(strcat(path,'**/*.csv'));
file_csv = struct2cell(file_csv)';
filename = file_csv(:,1);
filename = cell2str(filename,1);
AP = {}; %csv�ļ��ľ���·��
work_con = table('Size',[length(file_csv) 1],'VariableTypes',{'string'});
for i = 1 : length(file_csv)
    AP{i,1} = strcat(file_csv{i,2},'\',filename(i,1));
    [filepath,name,ext] = fileparts(AP{i,1});
    var = char(name);
    work_con{i,1} = name;
    eval([var, '= readtable(AP{i,1});']); %���ַ���ת��Ϊ����
end
work_con.Properties.VariableNames = {'work_conditon_name'};
work_con = topkrows(work_con,size(work_con,1),{'work_conditon_name'},{'ascend'});
%������������Ϊseq time temperature radio_heat
time_table = readtable('��ĩʱ��.csv');
count = 1;
for i = 1:2:size(time_table,2)
    str = sprintf("time_table = mergevars(time_table,{'Var%d','Var%d'},'NewVariableName',work_con.work_conditon_name{%d});",i,i+1,count);
    eval(str);
    count = count + 1;
end
%%
%������ȡ
%����Ҫ��ȡ��ʱ��תΪ����
for i = 1:size(time_table,2)
    time_table = addvars(time_table,time2sec(string(time_table{:,i}(:,:))),'After',time_table.Properties.VariableNames{end});
end
time_table(:,1:size(time_table,2)/2) = []; % ɾ������
% ������������NO_*_R0����ʱ����
for i = 1:size(time_table,2)
    str1 = sprintf("time_table.Properties.VariableNames{'%s'}=work_con.work_conditon_name{%d};",time_table.Properties.VariableNames{i},i);   
    eval(str1);
end
% ����NO_*_R0����ʱ����
for i = 1:size(time_table,2)
    str2 = sprintf("%s=analyzetime(time_table.Properties.VariableNames{%d});",time_table.Properties.VariableNames{i},i);
    eval(str2);
end
% ��ȡ
for i = 1:size(time_table,2)
    str2 = sprintf("[%s_T,%s_R] = exdata(time_table.(time_table.Properties.VariableNames{%d}),time_table.Properties.VariableNames{%d});",time_table.Properties.VariableNames{i},time_table.Properties.VariableNames{i},i,i);
    eval(str2);
end

%%
%�������
mkdir('Total_Output'); % �����ļ���,���ڴ��������
%����¶�����
T_data = who('*_T');
for i=1:size(who('*_T'))
    str = sprintf("%s = array2table(%s,'VariableNames',{'15kpa','20kpa','40kpa','60kpa','80kpa','101kpa'});",T_data{i},T_data{i});
    eval(str);
end
%����ȷ�������
R_data = who('*_R');
for i=1:size(who('*_R'))
    str = sprintf("%s = array2table(%s,'VariableNames',{'15kpa','20kpa','40kpa','60kpa','80kpa','101kpa'});",R_data{i},R_data{i});
    eval(str);
end
%д�뵽excel��
%д�¶�����
for i=1:size(who('*_T'))
    str = sprintf("writetable(%s,'Total_Output/Temperature.xlsx','Sheet','%s')",T_data{i},T_data{i});
    eval(str);
end
for i=1:size(who('*_R'))
    str = sprintf("writetable(%s,'Total_Output/Radio_heat.xlsx','Sheet','%s')",R_data{i},R_data{i});
    eval(str);
end
