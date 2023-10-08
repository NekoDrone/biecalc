function [y] = equationToPlotFor1b(t,y)
% Change the value of timeStep to change the desired time step.
    intervalLength = 5;
    timeStep = 0.2;
    numPoints = intervalLength/timeStep;
    t = linspace(0, 5, numPoints);
% Change the calculation of y in order to change the equation here to plot any equation.
% It must follow the format of y = f(t)
    y = t.^2 + (1/3).*t.^3 + 5.*t;
    plot(t, y, '-o');
end

