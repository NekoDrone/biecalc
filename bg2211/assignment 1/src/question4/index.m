% While studying for midterms, I wrote an implementation of Newton-Raphson
% in TypeScript. It was fun. The knowledge there comes in handy here.
% The code is available at a public GitHub repository if you are curious.
% https://github.com/NekoDrone/biecalc/blob/main/bg2211/newtonRaphson.ts

% Solving it analytically, when R = 3, and V = 30,
% We get a cubic equation in the form ax^3 + bx^2 + cx + d = 0,
% Where a = -pi, b = 9pi, c = 0, d = -90.
coeffs = [-pi, 9*pi, 0, -90];
h = roots(coeffs);
disp("Roots of Eqn:")
disp(h)
% Since the coefficient of x^3 is less than zero, we can conclude that the
% value of h must be either greater 2.0269m or lesser than 8.6139m. 

% The above shows the values from the solver provided by MATLAB.
% The below uses my version of Newton-Raphson, translated from the above
% repository originally written in TypeScript.

newtonRaphson(@calculateVolume,0,3)
newtonRaphson(@calculateVolume,3,3)