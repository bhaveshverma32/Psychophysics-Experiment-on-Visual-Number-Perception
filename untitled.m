%% weibull

 PSE_value1=zeros(100,4,3,LD);

for i=1:2
    S= [2 3 4 5 6 7];
    for n1=S
        SF = [1 2 3 4 5 6 7 8];
        SF(SF==n1)=[];
        X=SF;
        Y=comp(n1,SF,i,indi);
      
        [coefficients,PSE_ratio] = weibull_fit1(X,Y,n1,i,0);
        PSE_value1(n1,i,1,indi) = coefficients(1);
        PSE_value1(n1,i,2,indi) = coefficients(2);
        PSE_value1(n1,i,3,indi) = PSE_ratio;
        n1
        i
        indi
    end
end
for i=3:4
    S= round([20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5]);
    for n1=S
       

        SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]); 
        SF(SF==n1)=[];
        X=SF;
        Y=comp(n1,SF,i,indi);
      
        [coefficients,PSE_ratio] = weibull_fit1(X,Y,n1,i,0);
       
        PSE_value1(n1,i,1,indi) = coefficients(1);
        PSE_value1(n1,i,2,indi) = coefficients(2);
        PSE_value1(n1,i,3,indi) = PSE_ratio;
        
       n1 
       i
       indi
    end
end
end
%%
%%
%% for Fulldata
  
    M=MixData;
    indi=33;

for i=1:4
    Mi=M(M(:,1)==i,:);
MM(1:length(Mi),:,i) = Mi;
avgRT(i,indi) = sum(Mi(:,9),1)/length(Mi);
% accuracy for every individual combination 
    for j=1:length(Mi)
        n1=Mi(j,2);
        n2=Mi(j,4);
        comp(n1,n2,i,indi)=  comp(n1,n2,i,indi)+ Mi(j,7)/length(Mi(Mi(:,4)==n2 & Mi(:,2)==n1));
        RT(n1,n2,i,indi)= RT(n1,n2,i,indi)+ Mi(j,9)/length(Mi(Mi(:,4)==n2 & Mi(:,2)==n1));
    end
 % reaction time
%  for j=1:length(Mi)      
%  end
end

%%
    M=MixData;
    indi=33;
testing=ones(100,100,4,2);
for i=1:4

    Mi=M(M(:,1)==i,:);
    MM(1:length(Mi),:,i) = Mi;
    avgRT(i,indi) = sum(Mi(:,9),1)/length(Mi);
for n1=1:100
    for n2=1:100
    M1 =Mi(Mi(:,1)==i,:);
    M2 =M1(M1(:,2)==n1,:);
    M3 =M2(M2(:,4)==n2,:);
    comp(n1,n2,i,31)=mean(M3(:,7));
    comp(n1,n2,i,32)=std(M3(:,7));
    
    RT(n1,n2,i,31)=mean(M3(:,9));
    RT(n1,n2,i,32)=std(M3(:,9));
    
%    testing(n1,n2,i,1)=min(M3(:,7));
%    testing(n1,n2,i,2)=min(M3(:,9));

    end
end

end
%% weibull
c1=0;c2=0;

for i=1:2
    S= [2 3 4 5 6 7];
    for n1=S
        SF = [1 2 3 4 5 6 7 8];
        SF(SF==n1)=[];
        X=SF;
        Y=comp(n1,SF,i,indi);
      
        [coefficients,PSE_ratio] = weibull_fit1(X,Y,n1,i,0);
        PSE_value1(n1,i,1,indi) = coefficients(1);
        PSE_value1(n1,i,2,indi) = coefficients(2);
        PSE_value1(n1,i,3,indi) = PSE_ratio;
        n1
        i
        indi
    end
end
for i=3:4
    S= round([20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5]);
    for n1=S
        SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]); 
        SF(SF==n1)=[];
        X=SF;
        Y=comp(n1,SF,i,indi);
      
        [coefficients,PSE_ratio] = weibull_fit1(X,Y,n1,i,0);
        PSE_value1(n1,i,1,indi) = coefficients(1);
        PSE_value1(n1,i,2,indi) = coefficients(2);
        PSE_value1(n1,i,3,indi) = PSE_ratio;
        
       n1 
       i
       indi
    end
end

PSE_value1(:,:,3,31) = mean(PSE_value1(:,:,3,1:Indi),4);
PSE_value1(:,:,3,32) = std(PSE_value1(:,:,3,1:Indi),0,4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

