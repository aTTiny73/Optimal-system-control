
func = @(x)5*x^3-2*x-1
x1 = 0;
x2 = 2;
options = optimset('Display','iter');
x = fminbnd(func,x1,x2,options)