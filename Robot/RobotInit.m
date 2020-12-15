function arm = RobotInit(pert)
    N = 3; % cantidad de links

    L1 = 0;
    L2 = 152;
    L3 = 144;
    Lee = 144;

    % Masa 1kg
    m = 1 +(2*rand()-1)*pert;

    % Centro de masa en extremo
    r=L1; %hay que verlo bien
    rv = [r+(2*rand()-1)*pert, (2*rand()-1)*pert, 0];

    % Friccion unitaria:     'B', 1
    b = 1;  

    % Planar, sin momento de inercia.
    g=9.81;

    DH = struct('d', cell(1,N), 'a', cell(1,N), 'alpha', cell(1,N), 'theta', cell(1,N),...
        'type', cell(1,N)); %genera estructura base
    DH(1).alpha = 0;    DH(1).a = L1;    DH(1).d = 0;    DH(1).type = 'R';
    DH(2).alpha = 0;    DH(2).a = L2;   DH(2).d = 0;    DH(2).type = 'R';
    DH(3).alpha = 0;    DH(3).a = L3;   DH(3).d = 0;    DH(3).type = 'R';

    for  iLink = 1:N
            links{iLink} = Link('d', DH(iLink).d, 'a', DH(iLink).a, 'alpha', ...
                DH(iLink).alpha, 'm', m, 'r', rv, 'B', b, 'modified'); % Vector de estructuras Link
    end

    Tool = transl(Lee, 0, -100); % Offset de la herramienta
    
    arm = SerialLink([links{:}], 'tool', Tool, 'name', 'messi');

end