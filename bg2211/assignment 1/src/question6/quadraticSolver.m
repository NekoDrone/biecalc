function quadraticSolver()
    disp("Quadratic Equation Solver (Q6)")
    disp("Please enter the quadratic equation in the form ax^2 +bx + c = 0")
    a = input("Please enter the coefficient of x^2, a: ");
    b = input("Please enter the coefficient of x, b: ");
    c = input("Please enter constant c: ");
    determinant = b^2 -4*a*c;
    if determinant < 0
        disp ("Equation has no real roots")
    else
        if determinant == 0
            disp("Equation has one real root (double root):")
            answer = solveQuadratic(a,b,c);
            disp(answer)
        else
            disp("Equation has two real, distinct roots:")
            answer =solveQuadratic(a,b,c);
            disp(answer)
        end
    end
end

function x = solveQuadratic(a,b,c)
    x1 = (-b+sqrt(b^2-4*a*c))/2*a;
    x2 = (-b-sqrt(b^2-4*a*c))/2*a;
    if x1 == x2
        x = x1;
    else
        x = [x1,x2];
    end
    disp("The solution is:")
end
