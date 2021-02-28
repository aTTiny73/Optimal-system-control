clear all
close all
clc
% Funkcija quadprog rješava kvadratni program forme
% min 1/2*x'H*x+f*x
% uz ograničenja A*x<=b, Aeq*x=beq, lb<=x<=ub
% gdje su f, x, b, beq, lb, ub vektori n*1, A je matrica (m-me)*n
% Aeq je matrica me*n
% Poziv funckije
% x=quadprog(H,f,A,b), x=quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options)
% [xmin,fval,exitflag,output,lamba]=quadprog(H,f,A,b,Aeq,beq,lb);
% x0 je pocetna tacka
% Lambda su Langraževi multiplikatori
% Matrica Hesijana
H= [10 -6; -6 6]
eig(H)
% koeficijenti funckije cilja
f= [2;1]
% Ograničenja tipa nejednakosti
A=[2 1;1 0], b=[8;4]
% Ograničenje tipa jednakosti
Aeq=[], beq=[];
% Ograničenje skupa
lb=zeros(2,1), ub=[];
% Početna tačka je opcionalna
x0=[];
% Opcije, Default medium scale active set Algorithm
% Poziv funkcije quadprog
[xmin,fval,exitflag,output,lambda]=quadprog(H,f,A,b,Aeq,beq,lb);
disp('Optimalna vrijednost fukcije cilja je fmin='), fmin=-fval
disp('Optimum je dostignut u tacki xmin='), xmin
% Štampanje podataka optimizacije
output
disp('Langranzovi multiplikatori su lambda='),lambda
disp('Langranzovi multiplikatori su lambda.ineqlin='),lambda.ineqlin
disp('Langranzovi multiplikatori su lambda.lower='),lambda.lower

[x,y] = meshgrid(-10:10,-10:10);                                
Z = 5.*x.^2 + 3.*y.^2 - 6.*x.*y + 2.*x + y + 2;
meshc(x,y,Z)