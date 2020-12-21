clc;

vertex=[250 0; 250+100 100; 250+100 -100];
q_reposo = [0 2.5761 -2.5016 -0.1618];

%Perturbacion
pert = 0.0;

%Limites de joints
qlim_deg = [0 360; 20 180-20; -127 0; 5 35 ];
qlim = qlim_deg * pi / 180;

messi = RobotInit(pert,qlim);

draw_triangle(vertex, messi, 10, 1, q_reposo, 2);