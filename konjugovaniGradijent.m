
[xo,fo] = opt_conjg(@fx1,[0 0],1e-8,1e-8,1,100,2)

function y=fx1(x)
  y = x(1)^2 + 2*x(2)^2 - x(1)*x(2) + 5*x(1)-3*x(2);
end

function g=grad(f,x,h)
%Racuna gradijent funkcije f(x)
if nargin<3, h=.00001; end
h2 = 2*h; N=length(x);
I=eye(N);
for n=1:N
    g(n) = (feval(f,x+I(n,:)*h)-feval(f,x-I(n,:)*h))/h2;
end
end

function [xo,fo] = opt_conjg(f,x0,TolX,TolFun,alpha0,MaxIter,KC)
%KC = 2: Koristi metod konjugovanih gradijenata
if nargin < 7, KC = 0; end
if nargin < 6, MaxIter = 100; end
if nargin < 5, alpha0 = 10; end
if nargin < 4, TolFun = 1e-8; end
if nargin < 4, TolX = 1e-6; end
N=length(x0); nmax1=20; warning = 0; h=1e-4;%dimenzija promjenljive
x=x0; fx=feval(f,x0); fx0=fx;
for k = 1:MaxIter
    xk0=x; fk0=fx; alpha = alpha0;
    g=grad(f,x,h); s=-g;
    for n = 1:N
        alpha = alpha0;
        fx1=feval(f,x+alpha*2*s);
        for n1 = 1:nmax1 %Nalazi otpimalnu duzinu koraka
            fx2=fx1; fx1 = feval(f,x+alpha*s);
            if fx0 > fx1 + TolFun && fx1 < fx2 - TolFun %fx0 > fx1 < fx2
                den = 4*fx1 - 2*fx0 - 2*fx2; num = den-fx0 + fx2;
                alpha = alpha*num/den;
                x=x+alpha*s; fx=feval(f,x);
                break;
            elseif n1 == nmax1/2
                alpha = -alpha0; fx1 = feval(f,x + alpha*2*s);
            else
                alpha=alpha/2;
            end
        end
        x0=x
        fx0=fx
        if n<N
            g1 = grad(f,x,h);
            if KC <= 1,s = -g1 +(g1 -g)*g1'/(g*g'+1e-5)*s;
            else s=-g1+g1*g1'/(g*g'+ 1e-5)*s;
            end
            g=g1;
        end
        if n1>= nmax1,warning=warning+1;
            %nije nadjena optimalna duzina koraka
        else
            warning =0;
        end
    end
    if warning >= (norm(x-xk0,2)<TolX&&abs(fx-fk0)<TolFun),break;
    end
end
xo=x;fo=fx;
if k==MaxIter,fprintf('Just best in %d iterations',MaxIter),
end
end
            
        