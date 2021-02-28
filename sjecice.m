
%Metoda sjecice
metodasjecice(@(x)15*x^2-2,0.5,1,0.001,20)
function [x,ex] = metodasjecice(df,x0,x1,tol,nmax)
x(1)=x1;
x(2)=x(1) - (df(x(1))*(x(1)-x0))/(df(x(1))-df(x0));
ex(1)=abs(x(1)-x0);
k=2;
while(ex(k-1)>= tol) && (k <= nmax)
x(k+1)=x(k) - (df(x(k))*(x(k)-x(k-1)))/(df(x(k))-df(x(k-1)));
ex(k)=abs(x(k)-x(k-1));
k=k+1;
end
end