function file_rename(x)
%���ܣ��������ļ��м������ļ��е�csv�ļ�������������- NO.*-R0.csv ��NO_*_R0.csv
%
%�������x���ļ��еľ���·��

%x = 'F:\download\Matlab R2019b\bin\MATLAB_scripts\JYʵ����\task1\����2\';
data_csv = dir(strcat(x,'**/*.csv'));%��ȡ����csv�ļ�
data_csv = struct2cell(data_csv)';
new_path = {};
for i = 1 : length(data_csv)
    new_path{i,1} = strcat(data_csv{i,2},'\',data_csv{i,1});
end
%���µ����ִ洢��data_name
data_name = {};
for i = 1 : length(data_csv)
    [filepath,name,ext] = fileparts(new_path{i,1});
    data_name{i,1} = name;
    data_name{i,1} = split(data_name{i,1},[".","-"]);
    if length(data_name{i,1}) == 3
        num_str = cell2str(data_name{i,1}(2),1);
        num_char = convertStringsToChars(num_str);
        %�ж������Ƿ���һλ�������������ǰ��0
        if length(num_char) == 1
            data_name{i,1} = strcat(data_name{i,1}(1),'_','0',data_name{i,1}(2),'_',data_name{i,1}(3));
        else
            data_name{i,1} = join(data_name{i,1}(1:end),'.');
            data_name{i,1} = replace(data_name{i,1},{'.','-'},{'_','_'});
        end
    
        
        
    end
    data_name{i,1} = strcat(data_name{i,1},'.csv');
    
end

new_path = cell2str(new_path,1); %����cell2str��������cellת��Ϊstring
data_name = cell2str(data_name,1);

%����һ�δ����Ժ��ļ����Ѿ��������ˣ�...�����ж�Σ������ж��Ƿ��Ѿ��޸Ĺ������Ѿ��޸ĺã���ִ������������
for i = 1 : length(data_csv)
    if new_path(i,1) ~= strcat(data_csv{i,2},'\',data_name(i,1)) 
        movefile(new_path(i,1),strcat(data_csv{i,2},'\',data_name(i,1)));
    end
end



end
