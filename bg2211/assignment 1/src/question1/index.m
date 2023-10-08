% Question 1) A)
timeInterval = [0 5];
initialCondition = 0;
[t,y] = ode45(@(t,y) 2*t + t^2 + 5, timeInterval, initialCondition);
% ode45 doesn't provide a parameter to adjust time step, as the solver
% automatically adjusts the time step when calculating.
plot(t,y,'-o')
hold on

% Question 1) B)
% Analytical solution to the equation dy/dt = 2t + t^2 + 5 is
% y = t^2 + (1/3)t^3 + 5t + c
% with initial conditions as y = 0 at t = 0, c = 0, and so we use
% the equation y = t^2 + (1/3)t^3 + 5t
% This is the equation in the function file equationToPlotFor1b.m
equationToPlotFor1b;
xlabel('Time (t)');
ylabel('y');
legend('dydt = 2t + t^2 + 5', 'y = t^2 + (1/3)t^3 + 5t');
grid on

% The plots overlap quite well.