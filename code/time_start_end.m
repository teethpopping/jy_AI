%%
% 读取始末时间，其中有NO2，3，7，9，10，11，12
a = readtable('起末时间.csv');
b = table2array(a);
c = string(b);
NO2 =  c(:,(1:2));%读取指定工况的始末时间段