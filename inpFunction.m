
%% space key to continue
if num==21
    
KbName('UnifyKeyNames');
m = KbName('m');
z = KbName('z');
b = KbName('b');
spaceKey = KbName('Space');
escKey=KbName('Escape');
WaitSecs(0.3);
keyIsDown=0;
while 1
    FlushEvents('keyDown'); %?
    [keyIsDown, secs, keyCode] = KbCheck; % T1 =
    if keyIsDown
        if keyCode(spaceKey)
            break;
        elseif keyCode(escKey)
            ShowCursor;
            Screen('CloseAll');
            return;
        end
    end
end
Screen(windo,'TextFont','Arial');
Screen('TextStyle',windo,1)
Screen(windo,'TextSize',30);
end


   %% recording response and check if b is pressed
   
if num==22   
    
   keyIsDown=0;
    while 1
        [keyIsDown, secs, keyCode] = KbCheck;
        if keyIsDown
            if keyCode(m)
                responded_larger=1;
                break;
            end
            if keyCode(z)
                responded_larger=0;
                break;
            end
            if keyCode(b)
                short_break=1;
                break;
            end
        end
    end
    % callculations
    if short_break==0
    responsetime=secs;
    reactiontime = responsetime-Screen2time;
    accuracy= larger==keyCode(m);
    
    
    fwrite(data1,num2str(que(k)));  
    fprintf(data1,',');
    fwrite(data1,num2str(dots(k,1)));  
    fprintf(data1,',');
    fwrite(data1,num2str(Screen1time)); 
    fprintf(data1,',');
    fwrite(data1,num2str(dots(k,2)));  
    fprintf(data1,',');
    fwrite(data1,num2str(Screen2time)); 
    fprintf(data1,',');
    fwrite(data1,num2str(larger)); 
    fprintf(data1,',');
    fwrite(data1,num2str(responded_larger));  
    fprintf(data1,',');
    fwrite(data1,num2str(responsetime)); 
    fprintf(data1,',');
    fwrite(data1,num2str(reactiontime));  
    fprintf(data1,',');
    fwrite(data1,num2str(accuracy));  
    fprintf(data1,'\n');
    Screen('FillRect',windo,[255 255 255]);
    Screen('Flip',windo);
    
    end
    WaitSecs((1.050-0.950)*rand(1,1) + 0.950)
end

%% continue after short_break
if num==23  
    keyIsDown=0;
    while 1
        [keyIsDown, secs, keyCode] = KbCheck;
        if keyIsDown
            if keyCode(b)
                short_break=0;
                break;
            end
        end
    end
end
%% end: any key 
if num==24  
    keyIsDown=0;
    while 1
        [keyIsDown, secs, keyCode] = KbCheck;
        if keyIsDown
            break;
        end
    end
end