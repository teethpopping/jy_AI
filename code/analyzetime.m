function [output] = analyzetime(matrix_name)
% 数据处理-处理时间
%  数据类型转变：table --> datetime --> char --> string
%     NO_3_R0 = readtable('NO.3-R0.csv');%读取数据
%表中变量重命名
var_data = evalin('base', matrix_name);% 获取传入的数据
var_data.Properties.VariableNames{'Var1'} = 'seq';
var_data.Properties.VariableNames{'Var3'} = 'temperature';
var_data.Properties.VariableNames{'Var4'} = 'radio_heat';

T = table2array(var_data(:,2));%挑出时间列,T数据类型为datetime
TT = datestr(T);%挑出时间列,datetime --> char
TTT = string(TT);%char --> string
daytime = split(TTT);%split仅处理字符串数组、字符向量（？）或字符向量元胞数组（？）
time = time2sec(daytime(:,2));
%Q = array2table(out);将同构数组转换为表

var_data = removevars(var_data,{'Var2'});%删除原时间列（变量）
var_data = addvars(var_data,time,'Before','temperature');%将原时间转为秒数后得到的out（double类型）增加到原table中
output = var_data;
%NO_1_R0(:,2) = array2table(time);
%NO_1_R0.Properties.VariableNames{'out'} = 'time';