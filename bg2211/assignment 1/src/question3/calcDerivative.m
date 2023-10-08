function [x] = calcDerivative(f,x,h)
    disp("Forward Finite Difference:")
    disp(forwardCalc(f,x,h))
    disp("Backward Finite Difference:")
    disp(backwardCalc(f,x,h))
    disp("Central Finite Difference:")
    disp(centralCalc(f,x,h))
end

function x = forwardCalc(f,x,h)
    x = (f(x+h)-f(x))/h;
end

function x = backwardCalc(f,x,h)
    x = (f(x)-f(x-h))/h;
end

function x = centralCalc(f,x,h)
    x = (f(x+h)-f(x-h))/(2*h);
end
