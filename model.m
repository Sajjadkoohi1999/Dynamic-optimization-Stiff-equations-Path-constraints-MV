function dx=model(t,x,p)
global qd hsp qi A3 qo3i 
%% Constant variables
A3=1;
qd=1;  %disturbance variable (2nd inlet flow)
qi=1;
hsp=.25;
Cv=2;
qibar=1;
%% Optimization parameters @ Dynamic mode
Kc=p(1); Ti=p(2); A1=p(3); A2=p(4); h1=x(1); h2=x(2); h3=x(3);
I=x(4);     %integral mode of PI
J=x(5);     %objective function
Flimit=x(6);    %path function (physical limitation)
%% mass balance for each tank
qo1=Cv*sqrt(h1);
qo2=Cv*sqrt(h2);
qo3i=Cv*sqrt(h3);
%% Control system (PI)
e=hsp-h3; 
qo3=qo3i-Kc*(e+1/Ti*I);

%% ODE Equations
dh1=(qi+qd-qo1)/A1 ; %qd: disturbance flow 
dh2=(qo1-qo2)/A2  ;
dh3=(qo2-qo3)/A3  ;
dI=e;
dJ=(h3-hsp)^2;
dFlimit=max(0,-qo3); 

%% Obtain variables values per time (Dynamic mode)
dx=[dh1;dh2;dh3;dI;dJ;dFlimit];
end