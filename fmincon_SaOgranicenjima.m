x0 = [1/4,1/4];
lb = [0,0.2];
ub = [0.5,0.8];
options = optimset('LargeScale','off');

[x,fval]=fmincon(@objfun,x0,[],[],[],[],lb,ub,@confun)

function [c,ceq] = confun(x)
c = (x(1)-1/3)^2 + (x(2)-1/3)^2 - (1/3)^2;
ceq =[];
end

function f = objfun(x)
f=100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
end