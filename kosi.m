
[xo, fo] = opt_steep('fx1', [0 0], 1e-6, 1e-8, 1, 1000)

function y=fx1(X)
  y = X(1)^2 + 2*X(2)^2 - X(1)*X(2) + 5*X(1)-3*X(2);
end


function g = grad(f, x, h)
%gradijent funckije f(x)
if nargin < 3 , h = .00001; end
 
h2 = 2*h;
N = length(x);
I = eye(N);
for n = 1:N
    g(n) = (feval(f, x+I(n,:)*h)-feval(f,x-I(n,:)*h))/h2;
end
end
function [xo, fo] = opt_steep(f, x0, TolX, TolFun, alpha0, MaxIter)
if nargin < 6, MaxIter = 100; end
if nargin < 5, alpha0 = 10; end
if nargin < 4, TolFun = 1e-8; end
if nargin < 3, TolX = 1e-6; end
x = x0; fx0 = feval(f, x0); fx = fx0;
alpha = alpha0; kmax1 = 25;
warning = 0;
for k = 2 : MaxIter
    g = grad(f, x); g = g/norm(g);
    alpha = alpha*2;
    fx1 = feval(f, x - alpha*2*g);
    for k1 = 1:kmax1
        fx2 = fx1; fx1 = feval(f, x-alpha*g);
        if fx0 > fx1 + TolFun && fx1 < fx2 - TolFun
            den = 4*fx1 - 2*fx0 - 2*fx2;
            num = den -fx0 + fx2;
            alpha = alpha*num/den;
            x = x - alpha*g
            fx = feval(f,x)
            break;
        else alpha = alpha/2;
        end
    end
    if k1 <= kmax1, warning = warning + 1;
    else warning = 0;
    end
    if warning >= norm((x - x0),2) < TolX && abs((fx - fx0) < TolFun);
    end
    x0 = x;
    fx0 = fx;
end
xo = x;
fo = fx;
if k1 == MaxIter, fprintf('Just best in %d iterations', MaxIter)
end
end