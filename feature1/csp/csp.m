% Extract Common Spatial Pattern (CSP) Feature
close all; clear; clc;
savepath = 'F:\subject\';
load data1.mat
load data2.mat

load xlabel.mat
load clabel.mat

x_train = data1;
x_test  = data2;

label = xlabel;
clabel = clabel;

Y=label;
feature = [];
feature2 = [];
%% 
for k = 1:4
    label1 = label;
    label1(:,1)=2;
    index = find(label==k);
    label1(index,1)=1;

    EEGSignals.x=x_train;
    EEGSignals.y=label1;
%     Y=label1;

    classLabels = unique(EEGSignals.y); 
    CSPMatrix = learnCSP(EEGSignals,classLabels);
    nbFilterPairs = 11;

    X = extractCSP(EEGSignals, CSPMatrix, nbFilterPairs);  
%     feature(index,:) = X(index,:);
    feature = [feature,X];

    EEGSignals.x=x_test;
    T = extractCSP(EEGSignals, CSPMatrix, nbFilterPairs);  
    feature2 = [feature2,T];
    
end
%% 
featureli=feature;
featureli = zscore(featureli);
%% 1
feature2li=feature2;
feature2li = zscore(feature2li);
%% 2
strm=strcat([savepath,'feature22','.xlsx']);
xlswrite(strm,feature);
strm4=strcat([savepath,'label22','.xlsx']);
xlswrite(strm4,label);

%% 3
strm=strcat([savepath,'cefeature22','.xlsx']);
xlswrite(strm,feature2);
strm4=strcat([savepath,'celabel22','.xlsx']);
xlswrite(strm4,clabel);
%% 
color_L = [0 102 255] ./ 255;
color_R = [255, 0, 102] ./ 255;
pos = find(Y==1);
% plot(X(pos,1),X(pos,2),'x','Color',color_L,'LineWidth',2);
% plot(X(pos,1),X(pos,2),'xr','LineWidth',2);
plot(feature(pos,1),feature(pos,2),'xr','LineWidth',2);
hold on
pos = find(Y==2);
plot(feature(pos,1),feature(pos,2),'og','LineWidth',2);

hold on
pos = find(Y==3);
plot(feature(pos,1),feature(pos,2),'+b','LineWidth',2);

hold on
pos = find(Y==4);
plot(feature(pos,1),feature(pos,2),'.k','LineWidth',2);

legend('Left','Right')
xlabel('C3','fontweight','bold')
ylabel('C4','fontweight','bold')

