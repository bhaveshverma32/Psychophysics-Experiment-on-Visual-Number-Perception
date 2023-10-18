S= [2 3 4 5 6 7];
avgPSE_num = @(n1) sum(weibull_values(n1,:,3),2)./2;
avgPSE_type= @(i1) sum(weibull_values(:,i1,3),1)./length(S); %$ change length if S have different length for i=3 4

