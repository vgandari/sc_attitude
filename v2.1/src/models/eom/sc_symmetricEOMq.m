function xdot = sc_symmetricEOMq(t, x)
% EOM for a symmetric rigid body in circular orbit. Nominal motion
% assumed to be s/c spinning about its third axis, normal to ecliptic,
% at the same rate as the orbit mean motion. Orientation defined by
% quaternions.

    % IC = [q; w; I; K; Omega];
    % Initialize variables
    omega = zeros(1, 3);
    q = zeros(1, 4);

    % Unit quaternion
    q(1) = x(1);
    q(2) = x(2);
    q(3) = x(3);
    q(4) = x(4);

    % Angular velocity
    omega(1) = x(5);
    omega(2) = x(6);
    omega(3) = x(7);

    % Mean Motion
    Omega = x(14);

    % Inertia properties - constant
    X = x(11); % or x(12); symmetric about x(13) [K(3) = 0]
    % Y = omega(3)/Omega - 1;
    s = omega(3) - Omega;

    % Unit quaternion rates (Kinematic EOM)
    qdot(1) = q(2)*(omega(3) - s + Omega) - q(3)*omega(2) + q(4)*omega(1);
    qdot(2) = q(3)*omega(1) + q(4)*omega(2) - q(1)*(omega(3) - s + Omega);
    qdot(3) = q(4)*(omega(3) - s - Omega) + q(1)*omega(2) - q(2)*omega(1);
    qdot(4) = -q(1)*omega(1) - q(2)*omega(2) - q(3)*(omega(3) - s - Omega);
    qdot = qdot/2;

    %{
    qdot(1) = q(2) - q(3)*omega(2) + q(4)*omega(1);
    qdot(2) = q(3)*omega(1) + q(4)*omega(2) - q(1)*(omega(3) - s + Omega);
    qdot(3) = q(4)*Omega*(Y - s) + q(1)*omega(2) - q(2)*omega(1);
    qdot(4) = -q(1)*omega(1) - q(2)*omega(2) - q(3)*Omega(Y - s);
    qdot = qdot/2;
    %}

    % Angular acceleration (Dynamic EOM)
    wdot(1) = -s*omega(2) + X*(omega(2)*omega(3) ...
        -12*Omega^2 * (q(1)*q(2) - q(3)*q(4)) * (q(3)*q(1) + q(2)*q(4)));
    wdot(2) = s*omega(1) - X*(omega(1)*omega(3) ...
        -6*Omega^2 * (q(3)*q(1) + q(2)*q(4)) * (1 - 2*q(2)^2 - 2*q(3)^2));
    wdot(3) = 0;

    % Store state variables
    % q
    xdot(1) = qdot(1);
    xdot(2) = qdot(2);
    xdot(3) = qdot(3);
    xdot(4) = qdot(4);
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
    % Mean Motion (circular orbit)
    xdot(14) = 0;

    xdot = xdot';
end
