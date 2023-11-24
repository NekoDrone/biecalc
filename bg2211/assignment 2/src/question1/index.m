x0 = [1,1];
fun = @(x)costEquation(x(1),x(2));
[x,fval] = fminunc(fun, x0);
x
fval