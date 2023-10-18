function [coefficients,PSE] =weibull_fit1(X,Y,n1,i,p)


% weibullF = @(b,x) (b(1)./b(2)) .* ((x./b(2)).^(b(1)-1)) .* exp(-(x./b(2)).^b(1));
weibullF = @(b,x) 1-exp(-(x./b(1)).^b(2));
weibullinvF= @(b,y) (b(1)).*((-log(abs(1-y))).^(1./b(2)));

 X=X./n1; 
% tbl = table(X(:), Y(:));

mdl = fitnlm(X,Y,weibullF,[1 2]);
coefficients = mdl.Coefficients{:, 'Estimate'};
PSE = weibullinvF(coefficients,.5);

 
 %%
 if p==1 
     colr='b-';
     set='dot-dot';
     if i==2||i==4
          set='dots-symbol';
          colr='r-';
     end
format long g;
format compact;
fontSize = 10;
titlesize=10;
xFitted = linspace(min(X), max(X), 192); 
yFitted = weibullF(coefficients, xFitted(:));
yFitted = max(0, yFitted);

Fig = figure;


scatter(X,Y,'*')
%plot(X, Y, 'b.-', 'LineWidth', 2, 'MarkerSize', 30);
grid on;
xlabel(sprintf('2nd Image numerosity/%d',n1), 'FontSize', fontSize);
ylabel('proportion of response "larger"', 'FontSize', fontSize);
title(sprintf('Comparison plot for 1st Image numerosity = %d,\n comparison type %s',n1,set), 'FontSize', titlesize);
%PSE=%.2f, ,round(PSE,2 )
% set(gca,'xtick', [round(PSE,2 )], 'xticklabel', {'PSE'}, 'xlim', [0,5]);


hold on;
plot(xFitted, yFitted, colr, 'LineWidth', 2);
grid on;


% darkGreen = [0, 0.5, 0];
% xline(PSE(1), 'Color', darkGreen, 'LineWidth', 1);

legendHandle = legend('Data Points', 'Weibull fit', 'Location', 'northwest');
legendHandle.FontSize = 12;

 end