function xdot = sc_EOMC(t, x)
% EOM for an asymmetric rigid body in circular orbit. Nominal motion
% assumed to be s/c spinning about one of its own axes, normal to ecliptic,
% at the same rate as the orbit mean motion. Orientation defined by
% direction cosine matrices.

    % IC = [q; w; I; K; Omega; C(1, :), C(2, :), C(3, :)];

    % Initialize variables
    omega = zeros(1, 3);
    C = zeros(3, 3);

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

    omegadot = eulerTF(K, omega) + f2_C(K, C, Omega);

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


    xdot = transpose(xdot);
end
