clear all
x1=0; %Prva proizvoljna tacka
x2=2; %Druga proizvoljna tacka
epsilon = 0.0001;
sympref('FloatingPointOutput',true)
iteracija = 1;

while(1)

fX1 = f(x1);
fX2 = f(x2);
dfX1 = df(x1);
dfX2 = df(x2);
if(x1>=x2 || dfX1 >=0 || dfX2 <= 0)
    disp('Pocetne vrijednosti ne zadovoljavaju uslov x1<x2 && df(x1)<0 && df(x2) >0')
    return
end
syms a b c d
eqns = [a+b*x1+c*x1^2+d*x1^3==fX1, a+b*x2+c*x2^2+d*x2^3==fX2, b+2*c*x1+3*d*x1^2==dfX1, b+2*c*x2+3*d*x2^2==dfX2];
sol = solve(eqns,[a b c d]);
syms x
cubicFunc = sol.d*x^3 + sol.c*x^2 + sol.b*x + sol.a;
r = double(root(diff(cubicFunc),x));
if(r(1,1) > 0)
    xOptimal = r(1,1);
else
    xOptimal = r(2,1);
end
fOptimal = f(xOptimal);
yOptimal = cubic(sol.a,sol.b,sol.c,sol.d,xOptimal);
dfOptimal = df(xOptimal);
 if(abs(fOptimal-yOptimal)<epsilon)
        break
 elseif(dfOptimal < 0)
     x1 = xOptimal;
 else
     x2 = xOptimal;  
 end
 iteracija=iteracija+1
 
 
end
iteracija
xOptimal

function num = df(x)
    num = 15*x^2-2; % Izvod orginalne funkcije,editovat funkciju po potrebi
end
function num = f(x)
    num = 5*x^3-2*x-1; % Editovat funkciju po potrebi
end
function num = cubic(a,b,c,d,x)
    num = d*x^3 + c*x^2 + b*x + a;
end

