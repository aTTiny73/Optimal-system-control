clear all
F=[40 60];
A=[1 1;2 1;0 1];
b=[200 300 150];
lb = zeros(3,1);
options=optimset('LargeScale','off');
[x,fval] = linprog(-F,A,b,[],[],lb,[],[],options)
