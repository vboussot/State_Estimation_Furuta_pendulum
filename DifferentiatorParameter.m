clear all; close all; clc;
% Simulation parameter
Te = 1e-3;
T = 10;
% FIR low pass
f = 1000;
% MA
N = 10;
% Super Twisting
mu_1=1;
mu_2 = 0.1;
C = 2*pi*100;
lambda = mu_1*C^(1/2);
alpha = mu_2*C;
% HGO
A = [0,1;0,0];
C = [1, 0];
B = [0;1];
D = 0;
sys = ss(A,B,C,D);
epsilon = 0.001;
d = [epsilon; epsilon^2];
K = place(A', C', [-5,-2])'./d;
sys_obs = estim(sys,K, 1);