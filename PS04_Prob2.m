% CHEME 5440
% PS04
% Problem 2

%% This simulates the Recycling of EGF surface receptors from the Endosome


clear all;
close all;

% The variable species are:
% x1 = Rs
% x2 = Rs*
% x3 = Ri
% x4 = Ri*

% Initial conditions
x0 = [...
    2     % IC of Rs (nM)
    0       % IC of Rs* (nM)
    2     % IC of Ri (nM)
    0];     % IC of Ri* (nM)

%Pseudo random 
Kf = 0.8;
Kr = 0.02;
Ke = 0.6;
Ker = 0.02;
Kdeg = 0.3;
Vs = 0.07;
L = 2;
Krec = 0.1;

% Time-span
tspan = [0 10*60] ; % time-span in sec

% Use ODE45 solver
[t_out,x_out] = ode45(@(t,x) ODE2(t,x,Kf,L,Kr,Ke,Vs,Ker,Kdeg),tspan,x0);

maxActive1 = max(x_out(:,2)) + max(x_out(:,4));
         
% Plot results in nM values
figure(1);
hold on;
plot(t_out./60,x_out(:,1),'-ro'); % plot time in minutes
plot(t_out./60,x_out(:,2),'-ko'); % plot time in minutes
plot(t_out./60,x_out(:,3),'-co'); % plot time in minutes
plot(t_out./60,x_out(:,4),'-bo'); % plot time in minutes
legend('Rs','Rs*','Ri','Ri*','Location','Best');
title('Receptor Species Concentration Without Recycling')
set(gcf,'Position', [548 171 423 334]);
set(gcf,'Color', [1 1 1]);
set(gca,'FontName','Arial');
set(gca,'FontSize',14);
set(gca,'XGrid','off');
set(gca,'XLim',tspan./60);
set(gca,'YGrid','off');
xlabel('Time (min)','FontName','Arial','FontSize',14);
ylabel('Protein concentration (nM)','FontName','Arial','FontSize',14);
set(gca,'GridLineStyle','--');
set(gca,'TickDir','out');
box on;
grid on;
hold off;

tspan = [0 10*60] ; % time-span in sec

% Use ODE45 solver
[t_out,x_out] = ode45(@(t,x) ODE3(t,x,Kf,L,Kr,Ke,Vs,Ker,Kdeg,Krec),tspan,x0);

maxActive2 = max(x_out(:,2)) + max(x_out(:,4));
         
% Plot results in nM values
figure(2);
hold on;
plot(t_out./60,x_out(:,1),'-ro'); % plot time in minutes
plot(t_out./60,x_out(:,2),'-ko'); % plot time in minutes
plot(t_out./60,x_out(:,3),'-co'); % plot time in minutes
plot(t_out./60,x_out(:,4),'-bo'); % plot time in minutes
legend('Rs','Rs*','Ri','Ri*','Location','Best');
title('Receptor Species Concentration With Recycling')
set(gcf,'Position', [548 171 423 334]);
set(gcf,'Color', [1 1 1]);
set(gca,'FontName','Arial');
set(gca,'FontSize',14);
set(gca,'XGrid','off');
set(gca,'XLim',tspan./60);
set(gca,'YGrid','off');
xlabel('Time (min)','FontName','Arial','FontSize',14);
ylabel('Protein concentration (nM)','FontName','Arial','FontSize',14);
set(gca,'GridLineStyle','--');
set(gca,'TickDir','out');
box on;
grid on;
hold off;

%Check to see if analytical value of Rs is correct
Rs = max(x_out(:,2));
Rs_calc = ((Kdeg + Krec)*(Ker*Rs-Vs)-Krec*Ker*Rs)/(-Ke*Kdeg);
Rs_graph = max(x_out(floor(0.75*size(x_out,1)):size(x_out,1),1));
