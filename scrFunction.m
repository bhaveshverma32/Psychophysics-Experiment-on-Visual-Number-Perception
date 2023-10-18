%% Getting Screen info

if num==1
    
screens= Screen('screens');
screenNumber= max(screens);
[windo,window_size]=PsychImaging('OpenWindow',screenNumber,[255 255 255],[]);
x0=window_size(3)/2;
y0=window_size(4)/2;
HideCursor; 
end
%% instruction screen

if num==2
    

Instruction = ['Two types of screen will be displayed back to back. first screen contains a number \n' ...
'of dots and the second screen contains either a different number of dots or a number \n '...
'written in hindu-arabic system(eg:1 3 5). During the second screen press "m" if the current\n '...
'number is greater than the previous one and press "z" if it is smaller'];
DrawFormattedText(windo,Instruction,'center', 'center',[0 100 0]);
Screen('Flip',windo);

end
%% display dots-dots

if num==3
    
        M = M(:,randperm(size(M,2))); 
        Instruction = 'reference dots';
        DrawFormattedText(windo,Instruction,'center',30,[0 0 0]);

        Screen('DrawDots',windo,M(:,1:dots(k,1)),40,[0 0 0],[0 0],3);
        Screen('Flip',windo);
        Screen1time = GetSecs;%%%%%%%%%%%%%%%%

        WaitSecs((1.050-0.950)*rand(1, 1) + 0.950)

        M = M(:,randperm(size(M,2)));
        Instruction = 'Respond Z(for smaller) or M(for Larger)';
        DrawFormattedText(windo,Instruction,'center', 30,[255 0 0]);

        Screen('DrawDots',windo,M(:,1:dots(k,2)),40,[0 0 0],[0 0],3);
        Screen('Flip',windo);
        Screen2time = GetSecs;
         
end
%% display dots-number

if num==4
    
        M = M(:,randperm(size(M,2)));

        Instruction = 'reference dots';
        DrawFormattedText(windo,Instruction,'center',30,[0 0 0]);

        Screen('DrawDots',windo,M(:,1:dots(k,1)),40,[0 0 0],[0 0],3);
        Screen('Flip',windo);
        
        Screen1time = GetSecs;%%%%%%%%
        WaitSecs((1.050-0.950)*rand(1, 1) + 0.950)

        M = M(:,randperm(size(M,2)));
        Instruction = 'Respond Z(for smaller) or M(for Larger)';
        DrawFormattedText(windo,Instruction,'center', 30,[255 0 0]);
        
        Screen(windo,'TextSize',50);
        DrawFormattedText(windo, sprintf(' %d\n', dots(k,2)),'center','center',[110 0 0]);
        Screen(windo,'TextSize',30);

        Screen('Flip',windo);
        Screen2time = GetSecs;%%%%%%%%


end

%% Terminating

if num==10
    
Instruction = 'Thank You for Your Time. Press Any key To Exit';
Screen(windo,'TextFont','Arial');
Screen(windo,'TextSize',30);
DrawFormattedText(windo,Instruction,'center','center',[0 0 0]);
Screen('Flip',windo);

end