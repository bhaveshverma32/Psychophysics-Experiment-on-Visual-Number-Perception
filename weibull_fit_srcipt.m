% weibull_fit_srcipt

% weibullF = @(b,x) (b(1)./b(2)) .* ((x./b(2)).^(b(1)-1)) .* exp(-(x./b(2)).^b(1));
weibullF = @(b,x) 1-exp(-(x./b(1)).^b(2));
weibullinvF= @(b,y) (b(1)).*((-log(abs(1-y))).^(1./b(2)));

 X=X./n1;
tbl = table(X(:), Y(:));

mdl = fitnlm(tbl,weibullF,[1 1]);
coefficients = mdl.Coefficients{:, 'Estimate'};
PSE = weibullinvF(coefficients,.5);

 