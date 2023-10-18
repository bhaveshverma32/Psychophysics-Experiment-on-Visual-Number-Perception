% analysisV2
% Calculate avgcomp(probability of responding 'larger' averaged for each set)
% and  avgRT (average reaction time for each set)


M= MixData;
 M=AllData{3,2};

avgcomp=[0 0 0 0];
avgRT2=[0 0 0 0];
avgAccu=[0 0 0 0];
avgPSE = [0 0 0 0];
for i=1:4
Mi=M(M(:,1)==i,:);
    count=0;
    for j=1:length(Mi)
        n1=Mi(j,2);
        n2=Mi(j,4);
        count=count+1
       avgcomp(i) = avgcomp(i)+comp(n1,n2,i);
       avgRT2(i) = avgRT2(i)+Mi(j,9);
       avgAccu(i) = avgAccu(i) +Mi(j,10);
%        avgPSE(i) =  avgPSE(i) + weibull_values(n1,i,3,33);

    end
    avgcomp(i)=avgcomp(i)/count;
    avgRT2(i)=avgRT2(i)/count;
    avgAccu(i) = avgAccu(i)/count;
    avgPSE(i)=avgPSE(i)/count;

end
