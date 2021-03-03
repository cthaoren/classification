clear
clc
savepath = 'F:\Subject\';
namelist = dir('F:\Subject1\*.xlsx');

len = length(namelist);
for i = 1:len
    file_name{i}=namelist(i).name;
    x{i} = xlsread(file_name{i});
end
T1 = [];   
T2 = [];  
for i = 1:len
    a=x{i};
    SS = [];
    SS2 = [];
    for k = 1:22
        b=a(k,:);      
        [S,S2] = gaojiepufeature12(b);
        SS = [SS,S];
        SS2 = [SS2,S2];
    end
    T1= [T1;SS];
    T2= [T2;SS2];
end
%% 
featureli=T1;
featureli= zscore(featureli);
%% 
featureli2=T2;
featureli2 = zscore(featureli2);
%% 
strm=strcat([savepath,'gaofeature','.xlsx']);
xlswrite(strm,T1);
strm=strcat([savepath,'gaofeatureli','.xlsx']);
xlswrite(strm,featureli);
%% 
strm=strcat([savepath,'gaofeature2','.xlsx']);
xlswrite(strm,T2);
strm=strcat([savepath,'gaofeatureli2','.xlsx']);
xlswrite(strm,featureli2);
