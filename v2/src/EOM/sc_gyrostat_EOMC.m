function xdot = sc_gyrostat_EOMC(t, x)
% EOM for a gyrostat (rigid body with stabilizing rotor[s]) in circular
% orbit. Nominal motion assumed to be s/c spinning about one of its own
% axes, normal to ecliptic, at the same rate as the orbit mean motion.
% Orientation defined by direction cosine matrices.
    
    % Initialize variables
    I = zeros(1, 3);
    K = zeros(1, 3);
    omega = zeros(1, 3);
    C = zeros(3, 3);
    
    J = zeros(1, 3);
    b1 = zeros(1, 3);
    b2 = zeros(1, 3);
    b3 = zeros(1, 3);
    s = zeros(1, 3);
    sdot = zeros(1, 3);
    
    % Inertia properties - constant
    I(1) = x(1);
    I(2) = x(2);
    I(3) = x(3);
    
    K(1) = (I(2) - I(3))/I(1);
    K(2) = (I(3) - I(1))/I(2);
    K(3) = (I(1) - I(2))/I(3);
    
    % Angular velocity
    omega(1) = x(4);
    omega(2) = x(5);
    omega(3) = x(6);
    
    % Direction cosine matrix values
    C(1, 1) = x(7);
    C(1, 2) = x(8);
    C(1, 3) = x(9);
    C(2, 1) = x(10);
    C(2, 2) = x(11);
    C(2, 3) = x(12);
    C(3, 1) = x(13);
    C(3, 2) = x(14);
    C(3, 3) = x(15);
    
    % Mean Motion
    Omega = x(16);
    
    % Rotor Inertia
    J(1) = x(17);
    J(2) = x(18);
    J(3) = x(19);
    
    % Rotor Axis Orientations
    b1(1) = x(20);
    b1(2) = x(21);
    b1(3) = x(22);
    
    b2(1) = x(23);
    b2(2) = x(24);
    b2(3) = x(25);
    
    b3(1) = x(26);
    b3(2) = x(27);
    b3(3) = x(28);
    
    % Rotor Rates
    s(1) = x(29);
    s(2) = x(30);
    s(3) = x(31);
    
    sdot(1) = 0;
    sdot(2) = 0;
    sdot(3) = 0;
    
    % Angular acceleration (Dynamic EOM)
    r1 = rotor(I, J(1), omega, s(1), sdot(1), b1);
    r2 = rotor(I, J(2), omega, s(2), sdot(2), b2);
    r3 = rotor(I, J(3), omega, s(3), sdot(3), b3);
    
    omegadot = eulerTF(K, omega) + f2_C(K, C, Omega) ...
        + r1 + r2 + r3;
    
    % Direction cosine matrix rates (Kinematic EOM)
    Cdot = C*crossop(omega); % Poinsot Construction
    Cdot(1, 1) = Cdot(1, 1) + Omega*(C(1, 3)*C(3, 2) - C(1, 2)*C(3, 3));
    Cdot(1, 2) = Cdot(1, 2) + Omega*(C(1, 1)*C(3, 3) - C(1, 3)*C(3, 1));
    Cdot(1, 3) = Cdot(1, 3) + Omega*(C(1, 2)*C(3, 1) - C(1, 1)*C(3, 2));
    
    % Store state variables
    xdot(1) = 0;
    xdot(2) = 0;
    xdot(3) = 0;
    xdot(4) = omegadot(1);
    xdot(5) = omegadot(2);
    xdot(6) = omegadot(3);
    xdot(7) = Cdot(1, 1); 
    xdot(8) = Cdot(1, 2); 
    xdot(9) = Cdot(1, 3); 
    xdot(10) = Cdot(2, 1); 
    xdot(11) = Cdot(2, 2); 
    xdot(12) = Cdot(2, 3); 
    xdot(13) = Cdot(3, 1); 
    xdot(14) = Cdot(3, 2); 
    xdot(15) = Cdot(3, 3);
    xdot(16) = 0;
    xdot(17) = 0;
    xdot(18) = 0;
    xdot(19) = 0;
    xdot(20) = 0;
    xdot(21) = 0;
    xdot(22) = 0;
    xdot(23) = 0;
    xdot(24) = 0;
    xdot(25) = 0;
    xdot(26) = 0;
    xdot(27) = 0;
    xdot(28) = 0;
    xdot(29) = sdot(1);
    xdot(30) = sdot(2);
    xdot(31) = sdot(3);
    
    xdot = transpose(xdot);
end
