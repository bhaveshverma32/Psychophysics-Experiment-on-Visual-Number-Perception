% n=[1 2 3 4 5 6 7 8 9 10];
% A=[10 12 ];
% r=[3 5 7 9];
%%  for random dot position
%%
clear ;
close all;  
% ListenChar(2)%%%
rng('Shuffle');
Screen('Preference','SkipSyncTests',1);
tRef = GetSecs;
swi=3;
%%
screens= Screen('screens');
screenNumber= max(screens);
[windo,window_size]=PsychImaging('OpenWindow',screenNumber,[255 255 255],[]);
x0 = window_size(3)/2;
y0 = window_size(4)/2;
HideCursor; 
%%
x=(500:100:900);
y=(200:100:600);
M=CombVec(x,y);
A=[2000,6000,10000,14000,18000,22000,26000];
for j=1:10
totalA=A(j);
for i=1:10
M = M(:,randperm(size(M,2))); 

min=.1;
max=.9;
n=i;
totalR = (totalA ./pi).^(1/2);

ra = rand([1 n]);
ra = ra.*(max-min) + min;
devA = (ra./sum(ra)).*totalA; % sum of elements in ra = a
devR  = (ra./sum(ra)).*totalR;

devAR=(devA./pi).^(1/2);


Tarea=sum(pi.*(devAR.^2));
Std = std(pi.*(devAR.^2));

Screen('DrawDots',windo,M(:,1:n),devAR.*2 ,[0 0 0],[0 0],3);
Screen('Flip',windo);
Screen1time = GetSecs; %%%%%%%%%%%%%%%%
current_display = Screen('GetImage',windo,[400,100,1000,700]);
Filename= n+"_"+Tarea+"_"+Std+".png";
imwrite(current_display, Filename);
WaitSecs((1.050-0.950)*rand(1, 1) + 0.950)
end
end
