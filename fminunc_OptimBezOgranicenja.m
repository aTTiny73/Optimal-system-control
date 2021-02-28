
x0 = [2,1];
options = optimset('LargeScale','off');
[x,fval,exitflag,output]=fminunc(@objfun,x0,options)

function f = objfun(x)
f=exp(x(2))*(x(1)^2-2*x(2)^2+5*x(1)+7*x(1)*x(2)-4);
end