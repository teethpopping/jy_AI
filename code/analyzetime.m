function [output] = analyzetime(matrix_name)
% ���ݴ���-����ʱ��
%  ��������ת�䣺table --> datetime --> char --> string
%     NO_3_R0 = readtable('NO.3-R0.csv');%��ȡ����
%���б���������
var_data = evalin('base', matrix_name);% ��ȡ���������
var_data.Properties.VariableNames{'Var1'} = 'seq';
var_data.Properties.VariableNames{'Var3'} = 'temperature';
var_data.Properties.VariableNames{'Var4'} = 'radio_heat';

T = table2array(var_data(:,2));%����ʱ����,T��������Ϊdatetime
TT = datestr(T);%����ʱ����,datetime --> char
TTT = string(TT);%char --> string
daytime = split(TTT);%split�������ַ������顢�ַ��������������ַ�����Ԫ�����飨����
time = time2sec(daytime(:,2));
%Q = array2table(out);��ͬ������ת��Ϊ��

var_data = removevars(var_data,{'Var2'});%ɾ��ԭʱ���У�������
var_data = addvars(var_data,time,'Before','temperature');%��ԭʱ��תΪ������õ���out��double���ͣ����ӵ�ԭtable��
output = var_data;
%NO_1_R0(:,2) = array2table(time);
%NO_1_R0.Properties.VariableNames{'out'} = 'time';