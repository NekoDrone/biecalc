function output = newtonRaphson(fn,x0,maxIter)
    xprev = x0;
    x = 0;
    n = 0;
    h = 0.25;
    while n < maxIter
        x = xprev - ( fn(xprev) / ((fn(xprev+h)-fn(xprev))/h));
        xprev = x;
        n = n+1;
    end
    output = x;
end
    

