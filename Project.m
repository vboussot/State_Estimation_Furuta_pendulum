clear; close all; clc;
% Simulation parameter
T = 10;
Te = 1e-3;
%Model
pendulumParameter = PendulumParameter();
%Regulator
[A, B] = PendulumLinearModelTrajectory(pendulumParameter, 0,pi,0,0);
eig(A)
K = lqr(A, B, eye(4), 2);
X_eq = [0;-pi;0;0];