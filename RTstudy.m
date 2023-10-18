M=MixData;
ML=[M,zeros(length(M),1)];
x=0;
typ=M(1,1);
for i=1:length(M)
    
    if ML(i,1)==typ
        x=x+1;
    else
        x=1;
        typ=M(i,1);
    end  
    ML(i,11)=x;
end
    
M=ML;
indi=33;

Mpos=cell(4,6);
for i=1:4
for j=1:6
Mi=M(M(:,1)==i,:);
Mpos{i,j}=Mi(Mi(:,11)==j,:);
end
end

RTpos=zeros(4,6,2);
for i=1:4
for j=1:6
    

XX=Mpos{i,j};
RTpos(i,j,1) = mean(XX(:,9));
RTpos(i,j,2) = std(XX(:,9));
end
end

%%
Fig = figure;
hold on

pos=1:6;

errorbar(pos,RTpos(1,:,1),RTpos(1,:,2), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(pos,RTpos(2,:,1),RTpos(2,:,2), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(pos,RTpos(3,:,1),RTpos(3,:,2), 'b.--', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(pos,RTpos(4,:,1),RTpos(4,:,2), 'r.--', 'LineWidth', 2, 'MarkerSize', 30);


% plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);

grid on;
xlabel('position after swich', 'FontSize', fontSize);
ylabel('avg reaction time(s)', 'FontSize', fontSize);
title(sprintf('avg reaction time vs position after switching'), 'FontSize', titlesize);

legendHandle = legend('set 1(dots-dots)', 'set 2(dots-symbol)','set 3(dots-dots)', 'set 4(dots-symbol)', 'Location', 'northeast');
legendHandle.FontSize = titlesize;
hold off