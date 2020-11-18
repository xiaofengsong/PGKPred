clc
%function  PGKPredweb
%Lysine phosphoglycerylation sites predictor 


[head,seq]=fastaread('test_sample.txt');      %Please change here to specify the input file to PGKPredweb
seq=cellstr(seq);
head=cellstr(head);
SeqNumber=length(seq); %The number of sequences
%--------------------------------------------
%%identify the possible phosphoglycerylation sequence
%% Intercepting protein sequence fragments with a length of 15
t=0;
for i=1:SeqNumber   
    Se=seq{1,i};%The i-th sample sequence
    L=length(Se);%The length of this sequence
    if L>=15
      Number_Length_15=L-15+1;%The number of fragments of length 15 in the i-th sample
     for j=1:Number_Length_15
        fragment_j=Se(j:j+14);%截取长15片段；
        Name{1,t+j}=char(head(i));
        testD{1,t+j}=(fragment_j);
     end   
       t=t+Number_Length_15;
    end
end
Total_number_fragments=length(Name);%一共截取的样本
AA='ACDEFGHIKLMNPQRSTVWYX';
V=15;%the length of each sample
%%%%%%%%%%%%%%%%%%%%%%%

PPT1 = AAC(Name,testD);
PPT2 = CTDC(Name,testD);
%%
load allFeature.mat
ytest=zeros(Total_number_fragments,1);
ytest=[1*ones(1,16),-1*ones(1,1464)]';
%第1个特征分类器
xtest=PPT1;
model=svmtrain(TrainLabel1,TrainFeatureVector1, '-c 32 -g 4 -w1 1 -w-1 1 -t 2');
[predict_label1, accuracy1,dec_values1]=svmpredict(ytest,xtest,model);

%第2个特征分类器
xtest=PPT1;
model=svmtrain(TrainLabel2,TrainFeatureVector2, '-c 32 -g 2 -w1 1 -w-1 1 -t 2');
[predict_label2, accuracy2, dec_values2]=svmpredict(ytest,xtest,model);

%第3个特征分类器
xtest=PPT1;
model=svmtrain(TrainLabel3,TrainFeatureVector3, '-c 32 -g 4 -w1 1 -w-1 1 -t 2');
[predict_label3, accuracy3, dec_values3]=svmpredict(ytest,xtest,model);

%第4个特征分类器
xtest=PPT2;
model=svmtrain(TrainLabel4,TrainFeatureVector4, '-c 32 -g 1 -w1 1 -w-1 1 -t 2');
[predict_label4, accuracy4, dec_values4]=svmpredict(ytest,xtest,model);

%第5个特征分类器
xtest=PPT2;
model=svmtrain(TrainLabel5,TrainFeatureVector5, '-c 32 -g 1 -w1 1 -w-1 1 -t 2');
[predict_label5, accuracy5, dec_values5]=svmpredict(ytest,xtest,model);


pre=predict_label1+predict_label2+predict_label3+predict_label4+predict_label5;

fidout=fopen('results.txt','w');    %Please change here to specify the output results file.
for i=1:Total_number_fragments
    if pre(i,1)>=0
       fprintf(fidout,'The query sequence (%s) is a phosphoglycerylation sequence\r\n',Name{1,i});
    elseif pre(i,1)<0
       fprintf(fidout,'The query sequence (%s) is a non-phosphoglycerylation sequence\r\n',Name{1,i});
    end
end
fclose(fidout);






%集成以上分类器
ytest= [1*ones(1,16),-1*ones(1,1464)]';
pre=predict_label1+predict_label2+predict_label3+predict_label4+predict_label5;
dec_values=(dec_values1+dec_values2+dec_values3+dec_values4+dec_values5)/5;

t=size(ytest,1);
pt=numel(find(ytest==1));
nt=numel(find(ytest==-1));
TP=numel(find(pre(1:pt,1)>=0));
TN=numel(find(pre(pt+1:t,1)<0));
% [X,Y,THRE,AUC] = perfcurve(ytest,dec_values(:,1),'1');
% plot(X,Y)
% title('The ROC curves');
FP=nt-TN;
FN=pt-TP;
value=[TP,FP,TN,FN];
Sn=TP/(TP+FN);
Sp=TN/(TN+FP);
Acc=(TP+TN)/(TP+TN+FP+FN);
MCC=(TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));
Result=[Sn,Sp,Acc,MCC]






