%Fibonacci funkcija (potrebna kod Fibonaccijevog metoda)


%Fibonaccijeva metod a
%Koristi napravljenu funkciju fibonacci
fibometh(@(x)5*x^3-2*x-1,0,2,0.001)
function x = fibometh(f,a0,b0,epsilon)
    %fn+1&lt;= (b0-a0)/epsilon &lt;= fn+2
    n=1;
    i=1;
    c=(b0-a0)/epsilon;
    while(~(fibonacci(n+1) <= c && c <= fibonacci(n+2)))
        n=n+1;
    end

fn=fibonacci(n);
fn2=fibonacci(n+2);
y(1)=a0+(fn/fn2)*(b0-a0);
z(1)=a0+b0-y(1);
f(y(1));
f(z(1));
if(f(y(1))<=f(z(1)))
    a(1)=a0;
else
    a(1)=y(1);
end

if(f(y(1))<=f(z(1)))
    b(1)=z(1);
else
    b(1)=b0;
end

k=2;
while(k<=n)
if(f(y(k-1)) <= f(z(k-1)))
    y(k)=a(k-1)+b(k-1)-y(k-1);
    z(k)=y(k-1);
    fz(k)=f(y(k-1));
    x(k)=y(k);
    fy(k)=f(y(k));
else
    y(k)=z(k-1);
    fy(k)=f(z(k-1));    
    z(k)=a(k-1)+b(k-1)-z(k-1);
    x(k)=z(k);
    fz(k)=f(z(k));
end

if(fy(k)<=fz(k))
    a(k)=a(k-1);
else
    a(k)=y(k);
end

if(fy(k)<=fz(k))
    b(k)=z(k);
else
    b(k)=b(k-1);
end

k=k+1;

end
end