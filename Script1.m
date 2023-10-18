% %Script1
% for n1=[ 2 3 4 5 6 7]
% i=2;
% SF = [1 2 3 4 5 6 7 8];
% SF(SF==n1)=[];
% 
% X=SF;
% Y=comp(n1,SF,i);
% 
% weibull_fit1(X,Y,n1,1)
% end
% FolderName = '/home/userb/work/matlab/MATLAB_Drive/MATLAB_Drive/BhaveshSharedFolder/psyphy1/figures1';   % Your destination folder
% FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
% for iFig = 1:length(FigList)
%   FigHandle = FigList(iFig);
%   FigName   = num2str(get(FigHandle, 'Number'));
%   set(0, 'CurrentFigure', FigHandle);
%   savefig(fullfile(FolderName, [FigName '.fig']));
% end

%Script1
for n2=[  3 4 5 6 ]
i=2;
S = [ 2 3 4 5 6 7 ];
S(S==n2)=[];

X=S;
Y=1-comp(S,n2,i);

weibull_fit_srcipt

format long g;
format compact;
fontSize = 15;

xFitted = linspace(min(X), max(X), 192); 
yFitted = weibullF(coefficients, xFitted(:));
yFitted = max(0, yFitted);

Fig = figure;
scatter(X,Y,'*')
%plot(X, Y, 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
grid on;
xlabel('screen1 number', 'FontSize', fontSize);
ylabel('proportion response "larger"', 'FontSize', fontSize);
title(sprintf('screen2 num= %d     PSE=%.2f ',n1,round(PSE,2 )), 'FontSize', 15);

hold on;
plot(xFitted, yFitted, 'r-', 'LineWidth', 2);
grid on;

darkGreen = [0, 0.5, 0];
xline(PSE(1), 'Color', darkGreen, 'LineWidth', 1);

legendHandle = legend('Actual Y', 'Fitted Y', 'Location', 'northwest');
legendHandle.FontSize = 15;

end
FolderName = '/home/userb/work/matlab/MATLAB_Drive/MATLAB_Drive/BhaveshSharedFolder/psyphy1/figures1';   % Your destination folder
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Number'));
  set(0, 'CurrentFigure', FigHandle);
  savefig(fullfile(FolderName, [FigName '.fig']));
end