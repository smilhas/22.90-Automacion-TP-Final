clear all;

%% Creacion del brazo RRR

syms q1 q2 q3

%Perturbacion
pert = 0.0;

messi = RobotInit(pert);

%messi.fkine([q1, q2, q3])

w = 150;
h = 200;
cx = 330;

q = messi.ikine((transl(cx-w/2,-h/2,0))*trotz(-90)*troty(90),  'mask', [1 1 1 0 0 1]);
messi.plot(q);
plot_box('centre', [cx,0,0], 'size', [w,h], 'linewidth', 4)


%% Plot del espacio de trabajo

