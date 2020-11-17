  %%
    % ���ݴ���-����ʱ��
    %  ��������ת�䣺table --> datetime --> char --> string
    NO_3_R0 = readtable('NO.3-R0.csv');%��ȡ����
    %���б���������
    NO_3_R0.Properties.VariableNames{'Var1'} = 'seq';
    NO_3_R0.Properties.VariableNames{'Var3'} = 'temperature';
    NO_3_R0.Properties.VariableNames{'Var4'} = 'radio_heat';
    
    T = table2array(NO_3_R0(:,2));%����ʱ����,T��������Ϊdatetime
    TT = datestr(T);%����ʱ����,datetime --> char
    TTT = string(TT);%char --> string
    daytime = split(TTT);%split�������ַ������顢�ַ��������������ַ�����Ԫ�����飨����
    time = time2sec(daytime(:,2));
    %Q = array2table(out);��ͬ������ת��Ϊ��

    NO_3_R0 = removevars(NO_3_R0,{'Var2'});%ɾ��ԭʱ���У�������
    NO_3_R0 = addvars(NO_3_R0,time,'Before','temperature');%��ԭʱ��תΪ������õ���out��double���ͣ����ӵ�ԭtable��
    %NO_1_R0(:,2) = array2table(time);
    %NO_1_R0.Properties.VariableNames{'out'} = 'time';