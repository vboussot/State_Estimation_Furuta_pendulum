classdef PendulumParameter
    properties
      % DC Motor
      Rm;
      kt;
      km;
      
      % Rotary Arm
      M1;
      L1;
      J1;
      b1;
      cr;
      
      % Pendulum
      M2;
      L2;
      J2;
      b2;
      
      g = 9.81;
      
      p1;
      p2;
      p3;
      p4;
      p5;
      p6;
      %Jt = J1*J2 + M2*(L2/2)^2*J1 + J2*M2*L1^2;
    end
    methods
        function obj = PendulumParameter()
            % DC Motor
            obj.Rm = 8.4;
            obj.kt = 0.042;
            obj.km = 0.042;

            % Rotary Arm
            obj.M1 = 0.095;
            obj.L1 = 0.085;
            obj.J1 = obj.M1*obj.L1^2/12;
            obj.b1 = 0.001;
            obj.cr=0.0001;
            
            % Pendulum
            obj.M2 = 0.024;
            obj.L2 = 0.129;
            obj.J2 = obj.M2*obj.L2^2/12;
            obj.b2 = 0.0000;
            
            obj.p1 = obj.J1+obj.M2*obj.L1^2;
            obj.p2 = obj.J2+1/4*obj.M2*obj.L2^2;
            obj.p3 =1/2*obj.M2*obj.L1*obj.L2;
            obj.p4 = 1/2*obj.g*obj.M2*obj.L2;
            obj.p5 =obj.kt/obj.Rm;
            obj.p6 = obj.kt*obj.km/obj.Rm;
            
        end
    end
end