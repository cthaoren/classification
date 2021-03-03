%% 

clear
clc
DataPath = 'F:\subject\';
Savepath = 'F:\subjectmat\';
%% 
DataDir  = dir(DataPath);             
for i = 1:length(DataDir)
    if(isequal(DataDir(i).name,'.')||... 
       isequal(DataDir(i).name,'..')||...
       ~DataDir(i).isdir)                
           continue;
    end
    namelist = dir([DataPath DataDir(i).name '/*.xlsx']); 
    for j =1:length(namelist)                 
        file_name{j}=namelist(j).name;
        x{j} = xlsread([DataPath DataDir(i).name '/' namelist(j).name]);
    end
    %% 

    %% 
    if(isequal(DataDir(i).name,'769'))
        T1feature = [];
        for j = 1:length(namelist)
            a=x{j};
            SS = [];
            for k = 1:22
                b=a(k,:);      
                S = wentropy(b,'shannon'); 
                SS = [SS,S];
            end
            T1feature = [T1feature;SS];
        end
        save([Savepath,'T1wentropy.mat'],'T1feature');
        disp([DataDir(i).name,'over']);
        T1label = 1*ones(length(namelist),1);
        save([Savepath,'T1label.mat'],'T1label');
        disp([DataDir(i).name,'T1label']);
    end
    %% 
    if(isequal(DataDir(i).name,'770'))
        T2feature = [];
        for j = 1:length(namelist)
            a=x{j};
            SS = [];
            for k = 1:22
                b=a(k,:);      
                S = wentropy(b,'shannon'); 
                SS = [SS,S];
            end
            T2feature = [T2feature;SS];
        end
        save([Savepath,'T2wentropy.mat'],'T2feature');
        disp([DataDir(i).name,'over']);
        T2label = 2*ones(length(namelist),1);
        save([Savepath,'T2label.mat'],'T2label');
        disp([DataDir(i).name,'T2label']);
    end
    %% 
    if(isequal(DataDir(i).name,'771'))
        T3feature = [];
        for j = 1:length(namelist)
            a=x{j};
            SS = [];
            for k = 1:22
                b=a(k,:);      
                S = wentropy(b,'shannon'); 
                SS = [SS,S];
            end
            T3feature = [T3feature;SS];
        end
        save([Savepath,'T3wentropy.mat'],'T3feature');
        disp([DataDir(i).name,'over']);
        T3label = 3*ones(length(namelist),1);
        save([Savepath,'T3label.mat'],'T3label');
        disp([DataDir(i).name,'T3label']);
    end
    %% 
    if(isequal(DataDir(i).name,'772'))
        T4feature = [];
        for j = 1:length(namelist)
            a=x{j};
            SS = [];
            for k = 1:22
                b=a(k,:);      
                S = wentropy(b,'shannon'); 
                SS = [SS,S];
            end
            T4feature = [T4feature;SS];
        end
        save([Savepath,'T4wentropy.mat'],'T4feature');
        disp([DataDir(i).name,'over']);
        T4label = 4*ones(length(namelist),1);
        save([Savepath,'T4label.mat'],'T4label');
        disp([DataDir(i).name,'T4label']);
    end
      
end
