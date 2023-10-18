
% clc;%%%%%
 %decides length of experiment

clear ;
close all;  
% ListenChar(2)%%%
rng('Shuffle');
Screen('Preference','SkipSyncTests',1);
tRef = GetSecs;
swi=50;
%% User details

name = input('Name? ', 's');
age = input('Age? ', 's');

details = fopen(strcat(name,'_details.txt'),'w');
fprintf(details,strcat('Subject Name : ',name));
fprintf(details,'\n');
fprintf(details,strcat('Subject Age : ',age));
fprintf(details,'\n');

fclose(details);
%% result file
data1 = fopen(strcat(name,'_data.csv'),'w');
variable_names=['set_type(1-smalldots-smalldots.2-),screen1_number,screen1_time,screen2_number,screen2_time,is_larger,'...
'responded_larger,response_time,reaction_time,accuracy'];
fprintf(data1,variable_names);
fprintf(data1,'\n');

%% Getting Screen info
num=1;
scrFunction%%%%%

%% instruction screen
num=2;
scrFunction

%% space key to continue
num=21;
inpFunction%%%%%

%%
for section=1:2
    if section==1
    S= [2 3 4 5 6 7];
    SF = [1 2 3 4 5 6 7 8];
    order=[1 2 ];
%     swi=50; %decides length of experiment
    avgL=5;
    variL=[-2 -1 -1 0 0 1 1 2 ];
    end
    
    if section==2
    S= round([20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5]);
    SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]);
    order=[3 4 ];
   % swi=50; %decides length of experiment
    avgL=5;
    variL=[-2 -1 -1 0 0 1 1 2 ];
    end

avg_no_of_screen=swi*2*avgL*2;

n=100;
S_rep = repmat(S,1,n);
S_rep = S_rep(:,randperm(length(S_rep))); 


%% to generate que eg 111122222211111

% order=[1 2 ];%starting order eg 1324
order=order(:,randperm(length(order)));
orderfull= repmat(order,1,swi); % whole sequence of order eg 13241324..

ind=1;
for j=orderfull
    % j varies as  32143214..
    % que as 3333331111114444...
    Ntimesj=(avgL + variL(randi([1,length(variL(:))]))); 
    que(ind:ind+Ntimesj-1)=repmat(j,1,Ntimesj); 
    ind=ind+Ntimesj;
end



%%  for random dot position

x=(500:50:900);
y=(200:50:600);
M=CombVec(x,y);
%% 

i1=0;i2=0;short_break=0;
dots=zeros(length(que),4);

for k=1:length(que)
    
    if que(k)==1||que(k)==3
        i1=i1+1;
        dots(k,1)=  S_rep(i1);
        larger = randi([0,1]);
        dots(k,3)=larger;
        dots(k,4)=que(k);
        if larger==1
            dots(k,2)=SF(randi([ min(find(SF==dots(k,1))+1,length(SF)), length(SF)])); 
        else
            dots(k,2)=SF(randi([1, max(find(SF==dots(k,1))-1,1)]));
        end
        
        num=3;
        scrFunction   %%%%%%%%%%%
    end

    
    if que(k)==2||que(k)==4
        i2=i2+1;
        %RN=randi(1:length(s));
        %dots(k,1)=S(RN);
        dots(k,1)=  S_rep(i2);
        larger = randi([0,1]);
        dots(k,3)=larger;
        dots(k,4)=que(k);
        if larger==1
            dots(k,2)=SF(randi([ min(find(SF==dots(k,1))+1,length(SF)), length(SF)]));%find(SF==dots(k,1))=RN
        else
            dots(k,2)=SF(randi([1, max(find(SF==dots(k,1))-1,1)]));
        end
        
        num=4;
        scrFunction %%%%%%%%%%%%%%
       
    end
    
   %% recording response
   
   num=22;
   inpFunction
   %% break
   if short_break==1
       DrawFormattedText(windo, sprintf(' press "b" to continue the experiment'),'center','center',[0 110 0]);
       Screen(windo,'TextSize',30);
       Screen('Flip',windo);
       num=23;
       inpFunction  
   end
   short_break=0;
   
 
end
end %sections
    
%% Terminating

num=10;
scrFunction
save(strcat(name,'_workspace'));
fclose('all');
KbWait;
ListenChar(0) %%%
sca;