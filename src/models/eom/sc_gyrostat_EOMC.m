function xdot = sc_gyrostat_EOMC(t, x)
% EOM for a gyrostat (rigid body with stabilizing rotor[s]) in circular
% orbit. Nominal motion assumed to be s/c spinning about one of its own
% axes, normal to ecliptic, at the same rate as the orbit mean motion.
% Orientation defined by direction cosine matrices.
    % IC = [q; w; I; K; Omega; C(1, :), C(2, :), C(3, :), b1, b2, b3, s, J];

    % Initialize variables
    omega = zeros(1, 3);
    C = zeros(3, 3);
    % rotors
    J = zeros(1, 3);
    b1 = zeros(1, 3);
    b2 = zeros(1, 3);
    b3 = zeros(1, 3);
    s = zeros(1, 3);
    sdot = zeros(1, 3);

    % Angular velocity
    omega(1) = x(5);
    omega(2) = x(6);
    omega(3) = x(7);

    % Inertia Ratios - constant
    K(1) = x(11);
    K(2) = x(12);
    K(3) = x(13);

    % Mean Motion - constant
    Omega = x(14);

    % Direction cosine matrix values
    C(1, 1) = x(15);
    C(1, 2) = x(16);
    C(1, 3) = x(17);
    C(2, 1) = x(18);
    C(2, 2) = x(19);
    C(2, 3) = x(20);
    C(3, 1) = x(21);
    C(3, 2) = x(22);
    C(3, 3) = x(23);

    % Rotor Axis Orientations - constant
    b1(1) = x(24);
    b1(2) = x(25);
    b1(3) = x(26);

    b2(1) = x(27);
    b2(2) = x(28);
    b2(3) = x(29);

    b3(1) = x(30);
    b3(2) = x(31);
    b3(3) = x(32);

    % Rotor Inertia - constant
    J(1) = x(33);
    J(2) = x(34);
    J(3) = x(35);

    % Rotor Rates - constant
    s(1) = x(36);
    s(2) = x(37);
    s(3) = x(38);

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
    % q (not used)
    xdot(1) = 0;
    xdot(2) = 0;
    xdot(3) = 0;
    xdot(4) = 0;
    % w
    xdot(5) = omegadot(1);
    xdot(6) = omegadot(2);
    xdot(7) = omegadot(3);
    % I
    xdot(8) = 0;
    xdot(9) = 0;
    xdot(10) = 0;
    % K
    xdot(11) = 0;
    xdot(12) = 0;
    xdot(13) = 0;
    % Omega/Mean Motion (for circular orbit)
    xdot(14) = 0;
    % C
    xdot(15) = Cdot(1, 1);
    xdot(16) = Cdot(1, 2);
    xdot(17) = Cdot(1, 3);
    xdot(18) = Cdot(2, 1);
    xdot(19) = Cdot(2, 2);
    xdot(20) = Cdot(2, 3);
    xdot(21) = Cdot(3, 1);
    xdot(22) = Cdot(3, 2);
    xdot(23) = Cdot(3, 3);
    % b
    xdot(24) = 0;
    xdot(25) = 0;
    xdot(26) = 0;
    xdot(27) = 0;
    xdot(28) = 0;
    xdot(29) = 0;
    xdot(30) = 0;
    xdot(31) = 0;
    xdot(32) = 0;
    % J
    xdot(33) = 0;
    xdot(34) = 0;
    xdot(35) = 0;
    % s
    xdot(36) = 0;
    xdot(37) = 0;
    xdot(38) = 0;


    xdot = transpose(xdot);
end
