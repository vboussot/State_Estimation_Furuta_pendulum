function [theta_dot_1,theta_dot_2,theta_ddot_1,theta_ddot_2]=PendulumNonLinearModel(pp, theta_1,theta_2,theta_dot_1,theta_dot_2,u)
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
end