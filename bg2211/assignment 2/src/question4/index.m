n = linspace(2,10,100);

numericalS = zeros(100,1); % clear the array
analyticalS = zeros(100,1);

for i=1:1:length(n)
    ithElementOfN = n(i);
    numericalS(i) = 4*integral(@(x) funcToIntegrate(x,ithElementOfN), 0,2);
    analyticalS(i) = analyticalFormula(ithElementOfN);
end

plot(n,numericalS,'-o');
hold on
plot(n,analyticalS);
legend("Numerical", "Analytical");


function [y] = funcToIntegrate(x,n)
    xOver2=x/2;
    xOver2toN=xOver2.^n;
    y=nthroot(1-xOver2toN,n);
end

function [S] = analyticalFormula(n)
    twoRootPi = 2*sqrt(3.141592653);
    numerator1 = 4.^(1-(1/n));
    numerator2 = gamma(1+(1/n));
    numerator = numerator1*numerator2;
    denominator = gamma((1/2)+(1/n));
    S = twoRootPi*numerator/denominator
end