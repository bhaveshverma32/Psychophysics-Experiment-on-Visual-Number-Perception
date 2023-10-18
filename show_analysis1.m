%% Initiate (run only once)
  FullData
  analysisV1_single
  analysisV2


%% 
titlesize = 12;
fontSize = 12;
%% weibull fit example
indi=33;
n1=5;
i=1;
SF = [1 2 3 4 5 6 7 8];
SF(SF==n1)=[];

X=SF;
Y=comp(n1,SF,i,indi);

weibull_fit1(X,Y,n1,i,1)
% %% weibull fit example
% 
% n1=5;
% i=2;
% SF = [ 1 2 3 4 5 6 7 8];
% SF(SF==n1)=[];
% 
% X=SF;
% Y=comp(n1,SF,i,indi);
% 
% weibull_fit1(X,Y,n1,i,1)
% 
% %% weibull fit example
% 
% n1=29;
% i=3;
% SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]);
% 
% SF(SF==n1)=[];
% X=SF;
% Y=comp(n1,SF,i,indi);
% weibull_fit1(X,Y,n1,i,1)
% %% weibull fit example
% 
% n1=29;
% i=4;
% SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]);
% 
% SF(SF==n1)=[];
% X=SF;
% Y=comp(n1,SF,i,indi);
% weibull_fit1(X,Y,n1,i,1)
% 
% %% weibull fit example
% 
% n1=41;
% i=3;
% SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]);
% 
% SF(SF==n1)=[];
% X=SF;
% Y=comp(n1,SF,i,indi);
% weibull_fit1(X,Y,n1,i,1)
% 
% %% weibull fit example
% 
% n1=41;
% i=4;
% SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]);
% 
% SF(SF==n1)=[];
% X=SF;
% Y=comp(n1,SF,i,indi);
% weibull_fit1(X,Y,n1,i,1)
%% PSE vs screen1 num (small numerosity)

Fig = figure;
hold on

S= [2 3 4 5 6 7];
% plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(S,weibull_values(S,1,3,31),weibull_values(S,1,3,32), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(S,weibull_values(S,2,3,31),weibull_values(S,2,3,32), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
% errorbar(S,weibull_values(S,2,3,3),weibull_values(S,2,4,3), 'g.--', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,weibull_values(S,1,3,33), 'b.--', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,weibull_values(S,2,3,33), 'r.--', 'LineWidth', 2, 'MarkerSize', 30);


% plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);

grid on;
xlabel('Reference(1st Image) Numerosity', 'FontSize', fontSize);
ylabel('PSE (scaled)', 'FontSize', fontSize);
title(sprintf('PSE vs Reference(1st Image) Numerosity \n for small numbers'), 'FontSize', titlesize);

legendHandle = legend('dots-dots comparison', 'dots-symbol comparison', 'Location', 'northwest');
legendHandle.FontSize = titlesize;
hold off

%% PSE vs screen1 num (large nummerosity)
Fig = figure;
hold on
S= round([20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5]);
% % plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,weibull_values(S,3,3), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,weibull_values(S,4,3), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
% % plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);

errorbar(S,weibull_values(S,3,3,31),weibull_values(S,3,3,32), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(S,weibull_values(S,4,3,31),weibull_values(S,4,3,32), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
% errorbar(S,weibull_values(S,2,3,3),weibull_values(S,2,4,3), 'g.--', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,weibull_values(S,3,3,33), 'b.--', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,weibull_values(S,4,3,33), 'r.--', 'LineWidth', 2, 'MarkerSize', 30);

grid on;
xlabel('Reference(1st Image) Numerosity', 'FontSize', fontSize);
ylabel('PSE (scaled)', 'FontSize', fontSize);
title(sprintf('PSE vs Reference(1st Image) Numerosity \n for large numbers'), 'FontSize', titlesize);

legendHandle = legend('dots-dots comparison', 'dots-symbol comparison', 'Location', 'northwest');
legendHandle.FontSize = titlesize;
hold off


%% Screen2 number vs reaction time (for small numbers) /n example: n1=?
indi=31;

Fig = figure;
hold on
n1=4;
SF = [1 2 3 4 5 6 7 8];

SF(SF==n1)=[];
plot(SF,RT(n1,SF,1,indi), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
plot(SF,RT(n1,SF,2,indi), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);

grid on;
xlabel('screen2 number', 'FontSize', fontSize);
ylabel('reaction time(s)', 'FontSize', fontSize);
title(sprintf('Screen2 number vs reaction time \n example: screen1 num= %d (small number)',n1),'FontSize',titlesize);

legendHandle = legend('set 1(dots-dots)', 'set 2(dots-symbol)', 'Location', 'northeast');
legendHandle.FontSize = titlesize;
hold off

%% Screen2 number vs reaction time (for small numbers) /n example: n1=?
for n1=[3 6]
Fig = figure;
indi=31;
hold on

SF = [1 2 3 4 5 6 7 8];

SF(SF==n1)=[];

% for l=1:8
% plot(SF,RT(n1,SF,1,l), 'b.', 'LineWidth', 2, 'MarkerSize', 30);
% plot(SF,RT(n1,SF,2,l), 'r.', 'LineWidth', 2, 'MarkerSize', 30);
% end

% plot(SF,RT(n1,SF,1,indi+2), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
% plot(SF,RT(n1,SF,2,indi+2), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(SF,RT(n1,SF,1,indi),RT(n1,SF,1,indi+1), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(SF,RT(n1,SF,2,indi),RT(n1,SF,2,indi+1), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);

grid on;
xlabel('screen2 number', 'FontSize', fontSize);
ylabel('reaction time(s)', 'FontSize', fontSize);
title(sprintf('Screen2 number vs reaction time \n example: screen1 num= %d (small number)',n1),'FontSize',titlesize);

legendHandle = legend('set 1(dots-dots)', 'set 2(dots-symbol)', 'Location', 'northeast');
legendHandle.FontSize = titlesize;
hold off
end
%% Screen2 number vs reaction time (for large numbers) /n example: n1=?
for n1=[24 35]
Fig = figure;
hold on

SF = round([20/1.2, 20, 20*1.2, 20*(1.2)^2, 20*(1.2)^3, 20*(1.2)^4, 20*(1.2)^5, 20*(1.2)^6]);
SF(SF==n1)=[];
% plot(SF,RT(n1,SF,3,indi), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
% plot(SF,RT(n1,SF,4,indi), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(SF,RT(n1,SF,3,indi),RT(n1,SF,3,indi+1), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
errorbar(SF,RT(n1,SF,4,indi),RT(n1,SF,4,indi+1), 'r.-', 'LineWidth', 2, 'MarkerSize', 30);
% plot(S,avgPSE_num(S), 'b.-', 'LineWidth', 2, 'MarkerSize', 30);

grid on;
xlabel('screen2 number', 'FontSize', fontSize);
ylabel('reaction time(s)', 'FontSize', fontSize);
title(sprintf('Screen2 number vs reaction time \n example: screen1 num= %d (large number)   ',n1), 'FontSize', titlesize);

legendHandle = legend('set 1(dots-dots)', 'set 2(dots-symbol)', 'Location', 'northeast');
legendHandle.FontSize = titlesize;
hold off
end

%% average RT for each set type 

Fig = figure;
names = {'dot-dot(small numbers)'; 'dot-symbol(small numbers)'; 'dot-dot(large numbers)'; 'dot-symbol(large numbers)'};

b = bar(avgRT2,'FaceColor','flat') ;
b.CData(2,:) = [1 0 0];
b.CData(4,:) = [1 0 0];

set(gca,'xtick',[1:4],'xticklabel',names);
xlabel('Set Type', 'FontSize', fontSize);
ylabel('average reaction time (Sec)', 'FontSize', fontSize);
title(sprintf('average RT for each set type'), 'FontSize', titlesize);


%% average probability of response 'larger' for each set type

Fig = figure;
names = {'dot-dot(small numbers)'; 'dot-symbol(small numbers)'; 'dot-dot(large numbers)'; 'dot-symbol(large numbers)'};

b = bar(avgcomp,'FaceColor','flat') ;
b.CData(2,:) = [1 0 0];
b.CData(4,:) = [1 0 0];

set(gca,'xtick',[1:4],'xticklabel',names);
xlabel('Set Type', 'FontSize', fontSize);
ylabel('average probability to respond "larger"', 'FontSize', fontSize);
title(sprintf("average probability of response 'larger' for each set type "), 'FontSize', titlesize);

%% average PSE for each set type
Fig = figure;
names = {'dot-dot(small numbers)'; 'dot-symbol(small numbers)'; 'dot-dot(large numbers)'; 'dot-symbol(large numbers)'};

b = bar(avgPSE([1 2 3 4]),'FaceColor','flat') ;
b.CData(2,:) = [1 0 0];
b.CData(4,:) = [1 0 0];

set(gca,'xtick',[1:4],'xticklabel',names);
xlabel('Set Type', 'FontSize', fontSize);
ylabel('average PSE-ratio', 'FontSize', fontSize);
title(sprintf(' average PSE for each set type '), 'FontSize', titlesize);
%% average PSE for each set type
Fig = figure;
names = {'dot-dot(small numbers)'; 'dot-symbol(small numbers)'; 'dot-dot(large numbers)'; 'dot-symbol(large numbers)'};

b = bar(avgAccu([1 2 3 4]),'FaceColor','flat') ;
b.CData(2,:) = [1 0 0];
b.CData(4,:) = [1 0 0];

set(gca,'xtick',[1:4],'xticklabel',names);
xlabel('Set Type', 'FontSize', fontSize);
ylabel('average accuracy', 'FontSize', fontSize);
title(sprintf(' average accuracy for each set type '), 'FontSize', titlesize);
%% save graphs

FolderName = '/home/userb/work/matlab/MATLAB_Drive/MATLAB_Drive/BhaveshSharedFolder/psyphy1';   % Your destination folder
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Number'));
  set(0, 'CurrentFigure', FigHandle);
%   savefig(fullfile(FolderName, [FigName '.fig']));
  saveas(FigHandle,fullfile(FolderName, [FigName '.jpg']))
end
