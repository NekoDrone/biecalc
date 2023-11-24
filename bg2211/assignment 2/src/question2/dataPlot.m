function [] = dataPlot()
    sActual = [0.01 0.05 0.1 0.5 1 5 10 50 100]
    v0Actual = [0.000063636 0.007952 0.063472 6.0049 17.690 24.425 24.491 24.5 24.5]
    plot(sActual,v0Actual,'-o')
    hold on
    s1 = linspace(0,100);
    v01 = order1(s1)
    plot(s1,v01,'-o')


    s2 = s1;
    v02 = order2(s2)
    plot(s2,v02,'-o')

    s3 = s1;
    v03 = order3(s3)
    plot(s3,v03,'-o')
    
    legend("initial data", "order1", "order2", "order3")
    xlim([0,15])
    ylim([15,25])
    hold off
end

function [v0] = order1(s)
    k=25;
    K=3;
    v0 = (k.*s)./(K+s);
end

function [v0] = order2(s)
    k=25;
    K=3;
    v0 = (k*s.^2)./(K+s.^2);
end

function [v0] = order3(s)
    k=25;
    K=3;
    v0 = (k*s.^3)./(K+s.^3);
end