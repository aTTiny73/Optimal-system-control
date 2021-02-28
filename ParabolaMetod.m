clear all
x1=0; %Prva proizvoljna tacka
x2=1; %Druga proizvoljna tacka
x3=4; %Treca proizvoljna tacka

epsilon = 0.0000001;
sympref('FloatingPointOutput',true)
iteracija = 0;

while(1)
    iteracija = iteracija + 1
    fx1 = f(x1);
    fx2 = f(x2);
    fx3 = f(x3);
    if (fx1<=fx2 && fx2 >= fx3)
    disp('Pocetne vrijednosti ne zadovoljavaju uslov f(x1)>f(x2) && f(x2)<f(x3)')
    return
    end
    syms a b c
    eqns = [a+x1*b+c*x1^2==fx1, a+x2*b+c*x2^2==fx2, a+x3*b+c*x3^2==fx3];
    sol = solve(eqns,[a b c])
    syms x
    parabolaFunc = sol.c*x^2 + sol.b*x + sol.a;
    xOptimal = -((sol.b)/(2*(sol.c)));
    fOptimal = f(xOptimal);
    yOptimal = parabola(sol.a,sol.b,sol.c,xOptimal);
    inital = [x1 x2 x3 xOptimal];
    if(abs(fOptimal-yOptimal)<epsilon)
        break
    else
        newX2 = xOptimal;
        tmp = inital(inital>newX2);
        tmp1 = inital(inital<newX2);
        x1 = max(tmp1);
        x3 = min(tmp);
        x2 = newX2;
    end
    
end
xOptimal
function num = f(x)
    num = 5*x^3-2*x-1; % Editovat funkciju po potrebi
end
function num = parabola(a,b,c,x)
    num = a + b*x + c*x^2;
end
