clear all
close all
clc
global Tspan tol 
tol=1e-4;
Tspan=25;
%% Optimization solver
LB=[0,.1,.1,.1];
UB=[10,10,2,2];
x0=(UB+LB)/2;
options = optimoptions('fmincon','Algorithm','SQP');
tic
[p, OBJ, INFO,] = fmincon (@obj,x0,[],[],[],[],LB,UB,@cons,options);
toc;
INFO
%% Results
Kc=p(1);
Ti=p(2);
A1=p(3);
A2=p(4);
fprintf('J=%d\n',OBJ)
fprintf('K_c=%d\n',Kc)
fprintf('T_i=%d\n',Ti)
fprintf('A_1=%d\n',A1)
fprintf('A_2=%d\n',A2)

%Plot results to verify performance & stability
[t,x]=solvemodel(p,1);
