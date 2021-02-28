x0 = [0.5,0];
A = [1,2];
b = 1;
Aeq = [2,1];
beq = 1;
options = optimset('LargeScale','off');

[x,fval]=fmincon(@objfun,x0,A,b,Aeq,beq)

function f = objfun(x)
f=100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
end