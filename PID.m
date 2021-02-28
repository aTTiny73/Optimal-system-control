clear all
close all
clc
global K Ti Td Ts


s = tf('s');
G = 1/(s*(s+3)*(s+4));

kkr=84;
Tkr=1.8137
r=0.01
K=0.6*kkr;
Ti=0.5*Tkr
Td=0.125*Tkr
Ts=10;
[tp,xp,yp]=sim('simmod',[0 Ts]);
hold on
plot(tp,yp(:,2),'b-')
izbor = menu('izbor metoda','Simplex','Quasi-Newton');
if izbor == 1
[x,f,exitflag,output]= fminsearch(@funkcija,[K Ti Td]);
else
[x,f,exitflag,output]= fminunc(@funkcija,[K Ti Td]);
end
disp('Optimalni parametri kontrolera'),K=x(1),Ti=x(2),Td=x(3)
[tn,xn,yn]=sim('simmod',[0 Ts]);
plot(tn,yn(:,2),'r-')
hold off
disp('Podaci o optimizaciji'),output,output.message

function [kriterij]=funkcija(param)
global K Ti Td Ts
K=param(1);
Ti=param(2);
Td=param(3);
r=0.01;
[T,X,Y]=sim('simmod',[0 Ts]);
kriterij=max(Y(:,1));
end