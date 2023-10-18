% anova

% 1. reaction time
% 1.symbol 2.nonsymbol

%%
FullData;
M=MixData;

M1=M(M(:,1)==1,:); %
M2=M(M(:,1)==2,:); %
M3=M(M(:,1)==3,:); %
M4=M(M(:,1)==4,:); %
Ms=[M1;M2];
Ml=[M3;M4];
% Ml=Ms;

shortest=min([length(Ms),length(Ml)]);

% organize the data in a table
subject1=1:shortest;
subject1=string(subject1);
T = table(subject1.',Ms(1:shortest,9),Ml(1:shortest,9));

T.Properties.VariableNames = {'trials' 'Small' 'Large'};

% create the within-subjects design
withinDesign = table([1 2]','VariableNames',{'Condition'});
withinDesign.Condition = categorical(withinDesign.Condition);
% create the repeated measures model and do the anova
rm = fitrm(T,'Small-Large~1','WithinDesign',withinDesign);
AT = ranova(rm,'WithinModel','Condition'); % remove comma to see ranova's table
% output a conventional anova table
AT
rm.Covariance

multcompare(rm,'Condition')
%%
FullData;
M=MixData;
    indi=33;


M1=M(M(:,1)==1,:); %
M2=M(M(:,1)==2,:); %
M3=M(M(:,1)==3,:); %
M4=M(M(:,1)==4,:); %
shortest=min([length(M1),length(M2),length(M3),length(M4)]);


% organize the data in a table
subject1=1:shortest;
subject1=string(subject1);
length(M1(1:shortest,9))
T = table(subject1.',M1(1:shortest,9),M2(1:shortest,9),M3(1:shortest,9),M4(1:shortest,9));

T.Properties.VariableNames = {'trials' 'SmallDot' 'SmallSymbol' 'LargeDot' 'LargeSymbol'};

% create the within-subjects design
withinDesign = table([1 2 3 4]','VariableNames',{'Condition'});
withinDesign.Condition = categorical(withinDesign.Condition);
% create the repeated measures model and do the anova
rm = fitrm(T,'SmallDot-LargeSymbol~1','WithinDesign',withinDesign);
AT = ranova(rm,'WithinModel','Condition'); % remove comma to see ranova's table
% output a conventional anova table
AT
rm.Covariance
c=multcompare(rm,'Condition');
