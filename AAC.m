function PPT1 = AAC(Name, testD)
x1=Name;
WNp=length(x1);
M1=length(testD{1,1});
x=(M1+1)/2;%中间位置的“K”去掉

for i=1:WNp
    testD{1,i}(x)='';
    Str=testD{1,i};
    Str=char(Str);
    testD{1,i}=Str;
end
M=length(testD{1,1});
AA='ACDEFGHIKLMNPQRSTVWY';
testAAC=zeros(WNp,20);

for i=1:WNp
    for j=1:M
        s=testD{1,i}(j);
        t=strfind(AA,s);
        testAAC(i,t)=testAAC(i,t)+1;
    end
    testAAC(i,:)=testAAC(i,:)/M;%正样本中氨基酸的出现频率
end

PPT1=testAAC;
end
