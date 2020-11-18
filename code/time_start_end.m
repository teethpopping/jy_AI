function [sec_list] = time_start_end(time_table,start_colume,end_colume)
% 读取始末时间，其中有NO2，3，7，9，10，11，12
b = table2array(time_table);
c = string(b);
NO3 =  c(:,(start_colume:end_colume));%读取指定工况的始末时间段
sec_list = time2sec(NO3);
% clear a b c
