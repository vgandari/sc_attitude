function xdot = sc_symmetricEOMq(t, x)
% EOM for a symmetric rigid body in circular orbit. Nominal motion
% assumed to be s/c spinning about its third axis, normal to ecliptic,
% at the same rate as the orbit mean motion. Orientation defined by
% quaternions.

    % Initialize variables
    omega = zeros(1, 3);
    q = zeros(1, 4);
    
    % Inertia properties - constant
    X = x(1);
    
    % Angular velocity
    omega(1) = x(2);
    omega(2) = x(3);
    omega(3) = x(4);
    
    % Unit quaternion
    q(1) = x(5);
    q(2) = x(6);
    q(3) = x(7);
    q(4) = x(8);
    
    % Other things
    Omega = x(9);
    
    Y = omega(3)/Omega - 1;
    s = omega(3) - Omega;
    
    qdot(1) = q(2)*(omega(3) - s + Omega) - q(3)*omega(2) + q(4)*omega(1);
    qdot(2) = q(3)*omega(1) + q(4)*omega(2) - q(1)*(omega(3) - s + Omega);
    qdot(3) = q(4)*(omega(3) - s - Omega) + q(1)*omega(2) - q(2)*omega(1);
    qdot(4) = -q(1)*omega(1) - q(2)*omega(2) - q(3)*(omega(3) - s - Omega);
    qdot = qdot/2;
    
    wdot(1) = -s*omega(2) + X*(omega(2)*omega(3) ...
        -12*Omega^2 * (q(1)*q(2) - q(3)*q(4)) * (q(3)*q(1) + q(2)*q(4)));
    wdot(2) = s*omega(1) - X*(omega(1)*omega(3) ...
        -6*Omega^2 * (q(3)*q(1) + q(2)*q(4)) * (1 - 2*q(2)^2 - 2*q(3)^2));
    wdot(3) = 0;
    
    xdot(1) = 0;
    xdot(2) = wdot(1);
    xdot(3) = wdot(2);
    xdot(4) = wdot(3);
    xdot(5) = qdot(1);
    xdot(6) = qdot(2);
    xdot(7) = qdot(3);
    xdot(8) = qdot(4);
    xdot(9) = 0;
    
    xdot = xdot';
end