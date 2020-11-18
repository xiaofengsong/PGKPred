% CTD Descriptors - Composition
%This function calculates the Composition descriptor (Dim 39)
function [ctdc]=CTDC_file(str)
a1=0;a2=0;a3=0;
str = strrep(str,'X',''); 
len=length(str);
result=zeros(1,39);
group(1).hydrophobicity1='RKEDQN';
group(1).hydrophobicity2='QSTNGDE';
group(1).hydrophobicity3='QNGSWTDERA';
group(1).hydrophobicity4='KPDESNQT';
group(1).hydrophobicity5='KDEQPSRNTG';
group(1).hydrophobicity6='RDKENQHYP';
group(1).hydrophobicity7='KERSQD';
group(1).normwaalsvolume='GASTPDC';
group(1).polarity='LIFWCMVY';
group(1).polarizability='GASDT';
group(1).charge= 'KR';
group(1).secondarystruct='EALMQKRH';
group(1).solventaccess='ALFCGIVW';
  
group(2).hydrophobicity1 = 'GASTPHY';
group(2).hydrophobicity2 = 'RAHCKMV';
group(2).hydrophobicity3 = 'HMCKV';
group(2).hydrophobicity4 = 'GRHA';
group(2).hydrophobicity5 = 'AHYMLV';
group(2).hydrophobicity6 = 'SGTAW';
group(2).hydrophobicity7 = 'NTPG';
group(2).normwaalsvolume='NVEQIL';
group(2).polarity='PATGS';
group(2).polarizability='CPNVEQIL';
group(2).charge='ANCQGHILMFPSTWYV';
group(2).secondarystruct='VIYCWFT';
group(2).solventaccess='RKQEND';
  
group(3).hydrophobicity1 = 'CLVIMFW';
group(3).hydrophobicity2 = 'LYPFIW';
group(3).hydrophobicity3 = 'LPFYI';
group(3).hydrophobicity4 = 'YMFWLCVI';
group(3).hydrophobicity5 = ' FIWC';
group(3).hydrophobicity6 = 'CVLIMF';
group(3).hydrophobicity7 = 'AYHWVMFLIC';
group(3).normwaalsvolume='MHKFRYW';
group(3).polarity='HQRKNED';
group(3).polarizability='KMHFRYW';
group(3).charge='DE';
group(3).secondarystruct='GNPSD';
group(3).solventaccess= 'MSPTHY';

for i=1:13
switch i 
    case 1 
        tt=str;
        for t=1:len
            if strfind(group(1).hydrophobicity1,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).hydrophobicity1,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).hydrophobicity1,tt(t))~=0 
                        a3=a3+1;
                    end
                end
            end
        end
        result(i)=a1/len;a1=0;
        result(i+1)=a2/len;a2=0;
        result(i+2)=a3/len;a3=0;
     case 2
         tt=str;
         for t=1:len
            if strfind(group(1).hydrophobicity2,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).hydrophobicity2,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).hydrophobicity2,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(4)=a1/len;a1=0;
        result(5)=a2/len;a2=0;
        result(6)=a3/len;a3=0;
     case 3
         tt=str;
         for t=1:len
            if strfind(group(1).hydrophobicity3,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).hydrophobicity3,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).hydrophobicity3,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(7)=a1/len;a1=0;
        result(8)=a2/len;a2=0;
        result(9)=a3/len;a3=0;
     case 4
         tt=str;
         for t=1:len
            if strfind(group(1).hydrophobicity4,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).hydrophobicity4,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).hydrophobicity4,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(10)=a1/len;a1=0;
        result(11)=a2/len;a2=0;
        result(12)=a3/len;a3=0;
     case 5
         tt=str;
         for t=1:len
            if strfind(group(1).hydrophobicity5,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).hydrophobicity5,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).hydrophobicity5,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(13)=a1/len;a1=0;
        result(14)=a2/len;a2=0;
        result(15)=a3/len;a3=0;
     case 6
         tt=str;
         for t=1:len
            if strfind(group(1).hydrophobicity6,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).hydrophobicity6,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).hydrophobicity6,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(16)=a1/len;a1=0;
        result(17)=a2/len;a2=0;
        result(18)=a3/len;a3=0;
     case 7
         tt=str;
         for t=1:len
            if strfind(group(1).hydrophobicity7,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).hydrophobicity7,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).hydrophobicity7,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(19)=a1/len;a1=0;
        result(20)=a2/len;a2=0;
        result(21)=a3/len;a3=0;
     case 8  
         tt=str;
         for t=1:len
            if strfind(group(1).normwaalsvolume,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).normwaalsvolume,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).normwaalsvolume,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(22)=a1/len;a1=0;
        result(23)=a2/len;a2=0;
        result(24)=a3/len;a3=0;
     case 9  
         tt=str;
         for t=1:len
            if strfind(group(1).polarity,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).polarity,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).polarity,tt(t))~=0
                      a3=a3+1;
                    end
                end
            end
        end
        result(25)=a1/len;a1=0;
        result(26)=a2/len;a2=0;
        result(27)=a3/len;a3=0;
     case 10 
         tt=str;
         for t=1:len
            if strfind(group(1).polarizability,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).polarizability,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).polarizability,tt(t))~=0
                         a3=a3+1;
                    end
                end
            end
        end
        result(28)=a1/len;a1=0;
        result(29)=a2/len;a2=0;
        result(30)=a3/len;a3=0;
     case 11  
         tt=str;
         for t=1:len
            if strfind(group(1).charge,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).charge,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).charge,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(31)=a1/len;a1=0;
        result(32)=a2/len;a2=0;
        result(33)=a3/len;a3=0;
     case 12  
         tt=str;
         for t=1:len
            if strfind(group(1).secondarystruct,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).secondarystruct,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).secondarystruct,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(34)=a1/len;a1=0;
        result(35)=a2/len;a2=0;
        result(36)=a3/len;a3=0;
     case 13 
         tt=str;
         for t=1:len
            if strfind(group(1).solventaccess,tt(t))~=0
                a1=a1+1;
            else if strfind(group(2).solventaccess,tt(t))~=0
                a2=a2+1;
                else if strfind(group(3).solventaccess,tt(t))~=0
                        a3=a3+1;
                    end
                end
            end
        end
        result(37)=a1/len;a1=0;
        result(38)=a2/len;a2=0;
        result(39)=a3/len;a3=0;
end
end
ctdc=result;
end
