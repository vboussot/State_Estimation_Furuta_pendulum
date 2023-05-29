clear; close all; clc;
% Simulation parameter
Te = 1e-3;
T = 10;
% Two model
pendulumParameter_model_1 = PendulumParameter();
pendulumParameter_model_2 = PendulumParameter();
pendulumParameter_model_2.M1 = pendulumParameter_model_2.M1*1.1;
pendulumParameter_model_2.cr = pendulumParameter_model_2.cr*2;
pendulumParameter_model_2.Rm = pendulumParameter_model_2.Rm*2;
[A, B] =PendulumLinearModelTrajectory(pendulumParameter_model_1, 0,pi,0,0);
C = [1,0,0,0;0,1,0,0];
D = zeros(2,1);
%Regulator
K = lqr(A, B, eye(4), 10);
X_eq = [0;pi;0;0];
% base change
Base_Obs = [1,0,0,0;0,0,1,0;0,1,0,0;0,0,0,1];
% HGO
A1_obs = [0,1;0,0];
A2_obs = [0,1;0,0];
A_obs = [A1_obs, zeros(2); zeros(2), A2_obs];
epsilon_1 = 0.1;
epsilon_2 = 0.1;
d = [epsilon_1; epsilon_1^2];
d_1 = [epsilon_2; epsilon_2^2];
C1_obs = [1,0];
C2_obs = [1,0];
C_obs = [C1_obs, zeros(1,2); zeros(1,2), C2_obs];
K1_HGO = place(A1_obs', C1_obs', [-5,-7])'./d;
K2_HGO = place(A2_obs', C2_obs', [-5,-7])'./d_1;
K_HGO = [K1_HGO, zeros(2,1); zeros(2,1), K2_HGO];
% Sliding mode
K1_SM = place(A1_obs', C1_obs', [-30,-50])';
K2_SM = place(A2_obs', C2_obs', [-40,-90])';
K_SM = [K1_SM, zeros(2,1); zeros(2,1), K2_SM];
alpha_1 = 0.7;
alpha_2 = 0.7;
alpha = [alpha_1, 2*alpha_1-1, alpha_2, 2*alpha_2-1]';