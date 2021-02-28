 njutn([0;0],0.00001)

function res = f2(x)
    res=x(1)^2 + 2*x(2)^2 - x(1)*x(2) + 5*x(1)-3*x(2)
end

function res = gradf2(x)
res=[2*x(1)-x(2)+5;4*x(2)-x(1)-3];
end

function res = hesijanf2(x)
res=[2 -1;-1 4];
end

function res = njutn(x0,eps)
k=1;
xk=x0;
xk1=xk-hesijanf2(xk)^(-1)*gradf2(xk);
vrijednostf=f2(xk1);
while norm(gradf2(xk),'inf')>eps
    xk=xk1;
    xk1=xk-hesijanf2(xk)^(-1)*gradf2(xk);
    vrijednostf=f2(xk1);
    k=k+1;
end
res=xk1;
k
vrijednostf
end