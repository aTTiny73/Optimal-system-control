x0 = [0,0];
options = optimset('LargeScale','off');
[x,fval,exitflag,output]=fminunc(@objfun,x0,options)

function f = objfun(x)
f=x(1)^2 + 2*x(2)^2 - x(1)*x(2) + 5*x(1)-3*x(2)
end