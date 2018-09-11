function xdot = sc_EOMC(t, x)
% EOM for an asymmetric rigid body in circular orbit. Nominal motion
% assumed to be s/c spinning about one of its own axes, normal to ecliptic,
% at the same rate as the orbit mean motion. Orientation defined by
% direction cosine matrices.

    % Initialize variables
    K = zeros(1, 3);
    omega = zeros(1, 3);
    C = zeros(3, 3);

    % Inertia properties - constant
    K(1) = x(1);
    K(2) = x(2);
    K(3) = x(3);

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

    % Angular acceleration (Dynamic EOM)
    omegadot = eulerTF(K, omega) + f2_C(K, C, Omega);

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

    xdot = transpose(xdot);
end
