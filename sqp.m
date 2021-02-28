clear all, close all, clc
% Funkcija fmincon rjesava nelinearni program forme
% min f(x)
% uz ograničenja
% c(x)<=0, ceq(x)=0, A*x<=b, Aeq*x=beq, lb<=x<=ub
% gdje je f skalarna funkcija vektorskog argumenta,
% x, b, beq, lb, ub vektori n*1, A je matrica (m-me)*n
% Aeq je matrica me*n, c(x), ceq(x) su vektorske nelinearne funkcije
% vektorskog argumenta
% Poziv funkcije
% x=fmincon(fun,x0, A,b, Aeq, beq, lb, ub, nonlcon, options)
% [x,fval,exitflag,output,lambda,grad,hessian]=...
% fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options))
% x0 je pocetna tacka
% Lambda su Lagranzeovi multiplikatori
% Matrica Hessijan se računa quasi-newton aproksimacijom
% Ograničenja tipa nejednakosti
A=[3 1 1;-2 -2 -3;1 0 -1];
b=[36; -60; 0];
% Ograničenja tipa jednakosti
Aeq=[]; % nema ograničenja tipa jednakosti
beq=[];
% Ograničenje skupa
lb=zeros(3,1)
ub= []; %inf
% Nelinearna ograničenja
nonlcon=[]; % nema nelinearnih ograničenja
% Početna tačka
x0=[1,1,1];
%Opcije. Default agloritam je trust-region-reflective.
options=optimset('Algorithm','sqp');
% Poziv funkcije fmincon
[xmin,fmin,exitflag,output,lambda]=...
fmincon(@myfun1,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
disp('Optimalna vrijednost funkcije cilja u fmin='), fmin
disp('Optimum je dostignut u tacki xmin='), xmin
% Stampanje podataka o optimizaciji
output
disp('Langranzeovi multiplikatori su lambda='), lambda
disp('Langranzeovi mulitiplikatori su lambda.ineqlin ='),
lambda.ineqlin
function f=myfun1(x)
f=-6*x(1)+2*x(2)^2+x(2)+3*x(3)^2-x(3);
end