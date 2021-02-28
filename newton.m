
%Newton-ova metoda
newtonN(@(x)15*x^2-2,@(x)30*x,1.5,0.001,20)
function [x,ex] = newtonN(df,d2f,x0,tol,nmax)
x(1)=x0 - (df(x0))/(d2f(x0));
ex(1)=abs(x(1)-x0);
k=2;
while(ex(k-1)>= tol) && (k <= nmax)
x(k)=x(k-1) - (df(x(k-1)))/(d2f(x(k-1)));
ex(k)=abs(x(k)-x(k-1));
k=k+1;
end
end
