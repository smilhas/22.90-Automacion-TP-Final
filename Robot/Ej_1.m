close all; clear all; clc;

%% Creacion del brazo RRR

syms q1 q2 q3

%Perturbacion
pert = 0.0;

messi = RobotInit(pert);

%messi.fkine([q1, q2, q3])

messi.plot([0, 0, 0, 0]);


