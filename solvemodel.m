function [t,x]=solvemodel(p,withplot)
global hsp Tspan qo3i
%% Obtain variables values per time (Dynamic mode)
h0=.25; % initial guess
I0=0; % initial guess
J0=0; % initial guess
Flimit0=0; % initial guess
[t,x]=ode23s(@(t,x)model(t,x,p),[0 Tspan],[h0;h0;h0;I0;J0;Flimit0]);
h1=x(:,1); h2=x(:,2); h3=x(:,3); I=x(:,4);
if withplot
%% Reconstruct control actions
Kc=p(1);
Ti=p(2);
qo3=qo3i-Kc*(hsp-h3+1/Ti*I); % Direct control is needed 
%% Post solve simulation
    subplot(2,2,1)
    
    plot(t,h3,'r','LineWidth',2)
    ylabel('Level h_3','FontSize',16,'FontWeight','bold')
    xlabel('time','FontSize',16,'FontWeight','bold')
    grid on
  
    subplot(2,2,2)
    plot(t,qo3,'LineWidth',2)
    ylabel('Flow q_o3','FontSize',16,'FontWeight','bold')
    xlabel('time','FontSize',16,'FontWeight','bold')
    grid on
    
    subplot(2,2,3)
    plot(t,h1,'LineWidth',2)
    ylabel('Level h_1','FontSize',16,'FontWeight','bold')
    xlabel('time','FontSize',16,'FontWeight','bold')
    grid on
    
    subplot(2,2,4)
    plot(t,h2,'LineWidth',2)
    ylabel('Level h_2','FontSize',16,'FontWeight','bold')
    xlabel('time','FontSize',16,'FontWeight','bold')
    grid on
end
end