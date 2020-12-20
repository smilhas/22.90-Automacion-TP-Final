%% Creacion del brazo RRR

syms q1 q2 q3;

%Perturbacion
pert = 0.0;

%Limites de joints
qlim_deg = [0 360; 20 180-20; -127 0; 5 35 ];
qlim = qlim_deg * pi / 180;
%qlim_rad = [0 2*pi; 0.8446 pi-0.8446 ; -2.3454 0; 0 pi*3/4 ];

messi = RobotInit(pert,qlim);

%messi.fkine([q1, q2, q3])

w = 150;
h = 200;
cx = 300;
cy = 0;

attack_cercano = -25;
attack_lejano = 0;

q = messi.ikine((transl(cx+w/2,cy,0))*trotz(-90)*troty(90),  'mask', [1 1 1 0 0 1]);

q_cercano = messi.ikine((transl(cx-w/2,cy,0))*trotz(-90+attack_cercano),  'mask', [1 1 1 0 0 1]);
q_lejano = messi.ikine((transl(cx+w/2,cy+h/2,0))*trotz(-90+attack_lejano),  'mask', [1 1 1 0 0 1]);
q_cercano_deg = q_cercano * 180 / pi;
q_lejano_deg = q_lejano * 180 / pi;


q_test = q;
q_test(3) = q_cercano(3);
q_test(4) = q_lejano(4);
messi.plot(q_cercano);
hold on;
plot_box('centre', [cx,0,0], 'size', [w,h], 'linewidth', 4);



%% Plot del espacio de trabajo



c = jet;

hold on;
for n=1:1:100000
    
    theta = [0 0 0 0];
    for m = 1:4
        theta(m) = qlim(m,1) + (qlim(m,2) - qlim(m,1)) * rand(1,1);
    end

    Mricx = messi.fkine(theta);
    hold on;
    
    %coordenada X esta en [-500.0 500.0], la mapeo a [0, 255]:
    color_index = round(Mricx.t(1)/4.5 + 127);
    
%    if Mricx.t(2) < cy + h/2 && Mricx.t(2) > cy - h/2
        plot3(Mricx.t(1),Mricx.t(2),Mricx.t(3),'b.','MarkerSize', 2, 'Color', c(color_index,:) );
%    end
    
end