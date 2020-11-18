function PPT2 = CTDC(Name,testD)

x1=Name;
WNp=length(x1);
for i=1:WNp
    Str=testD{1,i};
    Str=char(Str);
    testD{1,i}=Str;
end

testCTDC=[];
for i=1:WNp
    result=CTDC_file(testD{1,i});
    testCTDC=[testCTDC;result];
end

PPT2=testCTDC;
end

