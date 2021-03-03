function [feature1,feature2] = gaojiepufeature12(input)
data = input;
[bspec,waixis]= bispecd(data,1024,5,100,50);

aaa  = abs(bspec);
f = waixis*250;
dui = diag(aaa);

alpha = dui(546:566,:);
logalpha = log(alpha);
alphahe = sum(logalpha(:));

belta = dui(567:635,:);
logbelta = log(belta);
beltahe = sum(logbelta(:));
%% 
alpha2 = aaa(546:566,546:566);
logalpha2 = log(alpha2);
alphahe2 = sum(logalpha2(:));

belta2 = aaa(567:635,567:635);
logbelta2 = log(belta2);
beltahe2 = sum(logbelta2(:));
%% 
feature1 = [alphahe,beltahe];
feature2 = [alphahe2,beltahe2];