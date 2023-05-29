clear; close all; clc;
figure;
hold on
t_span = [0,50];
theta_2_span = pi-0.5:0.1:pi+0.5;
theta_dot_2_span = 0;-30:10:30;
for theta_2 = theta_2_span
    for theta_dot_2 = theta_dot_2_span
        [t_out, stat_out] = ode45(@PendulumNonLinearModel,t_span, [0;theta_2;0;theta_dot_2]);
        plot(stat_out(:,2), stat_out(:,4));
    end
end
xlabel('\theta_2')
ylabel('$\dot{\theta_2}$', 'Interpreter','latex')
title('Phase space of the pendulum for several initial conditions')
%%
function [state_out]=PendulumNonLinearModel(t, state)
    theta_1 = state(1);
    theta_2 = state(2);
    theta_dot_1 = state(3);
    theta_dot_2 = state(4);
    u = 0;
    pp = PendulumParameter();
    X = [theta_1;
         theta_dot_1;
         theta_dot_2;
         theta_dot_1*theta_dot_2;
         theta_dot_1^2;
         theta_dot_2^2;
         1; 
         u];
     N = (pp.p2^2+pp.p3^2)*sin(theta_2)^2+pp.p1*pp.p2-pp.p3^2;
     a3 = [-pp.cr*pp.p2;
           -pp.p2*pp.p6-pp.b1*pp.p2;
            pp.b2*pp.p3*cos(theta_2);
           -pp.p2^2*sin(2*theta_2);
           -pp.p2*pp.p3*sin(theta_2)*(1-sin(theta_2)^2);
           +pp.p2*pp.p3*sin(theta_2);
           1/2*pp.p3*pp.p4*sin(2*theta_2);
           pp.p2*pp.p5];
       
     a4 = [ pp.cr*pp.p3*cos(theta_2);
            (pp.b1*pp.p3+pp.p3*pp.p6)*cos(theta_2);
           -pp.b2*(pp.p1+pp.p2*sin(theta_2)^2);
            2*pp.p2*pp.p3*sin(theta_2)*(1-sin(theta_2)^2);
            pp.p2*(pp.p2*cos(theta_2)*sin(theta_2)^3+1/2*pp.p1*sin(2*theta_2));
           -1/2*pp.p3^2*sin(2*theta_2);
           -pp.p4*sin(theta_2)*(pp.p1+pp.p2*sin(theta_2)^2);
           -pp.p3*pp.p5*cos(theta_2)];
    theta_ddot_1 = 1/N*a3'*X;
    theta_ddot_2 = 1/N*a4'*X;
    state_out = [theta_dot_1;theta_dot_2;theta_ddot_1;theta_ddot_2];
end