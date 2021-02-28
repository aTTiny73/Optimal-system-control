options = optimset('PlotFcns',@optimplotfval);
fun = @(x)x(1)^2 + 2*x(2)^2 - x(1)*x(2) + 5*x(1)-3*x(2);
x0 = [-1.2,1];
x = fminsearch(fun,x0,options)
