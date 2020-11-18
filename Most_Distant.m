%Most distant undersampling
[hp,positive]=fastaread('trainP.txt');
[hn,negative]=fastaread('trainN.txt');
Np=length(hp);
Nn=length(hn);
for i=1:Np
    str=positive{1,i};
    str=char(str);
    positive{1,i}=str;
end
for i=1:Nn
    str=negative{1,i};
    str=char(str);
    negative{1,i}=str;
end
AA='ACDEFGHIKLMNPQRSTVWYX';
L=length(positive{1,1});
M=length(AA);
%%先把正负样本用0,1编码表示
%正样本
PPT1=zeros(Np,L*M);
for i=1:Np
    ppp=zeros(L,M);
    for j=1:L
        s=positive{1,i}(j);
        t=strfind(AA,s);
        ppp(j,t)=ppp(j,t)+1;
    end
    PPT1(i,:)=reshape(ppp',1,L*M);
end
%负样本
PPT2=zeros(Nn,L*M);
for i=1:Nn
    nnn=zeros(L,M);
    for j=1:L
        s=negative{1,i}(j);
        t=strfind(AA,s);
        nnn(j,t)=nnn(j,t)+1;
    end
    PPT2(i,:)=reshape(nnn',1,L*M);
end

m=zeros(1,Nn);
for i=1:Nn
    neg=PPT2(i,:);
    [idx, dist] = knnsearch(PPT1,neg,'k',3);
    m(1,i)=(dist(1,1)+dist(1,2)+dist(1,3))/3;
end
[m1,order]=sort(m,'descend');
x=order(1,1:757);%选择合适的负类样本个数

%%%%把得到的负类样本输出成txt格式方便进行特征提取
fid=fopen('trainN_mostdistant.txt','wt');
for k=x(1,1:757)
    fprintf(fid,'%s%d\n%s\n','>N',k,negative{1,k});
end
fclose('all');
% save('MostDistant_train.mat')
