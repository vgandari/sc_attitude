function xdot = tf_EOMq(t, x)
% EOM for a rigid body in torque free environment. Orientation defined by
% quaternions.
    % IC = [q; w; I; K; Omega];

    % Initialize variables
    q = zeros(1, 4);
    omega = zeros(1, 3);
    K = zeros(1, 3);

    % Unit quaternion
    q(1) = x(1);
    q(2) = x(2);
    q(3) = x(3);
    q(4) = x(4);

    % Angular velocity
    omega(1) = x(5);
    omega(2) = x(6);
    omega(3) = x(7);

    % Inertia Ratios - constant
    K(1) = x(11);
    K(2) = x(12);
    K(3) = x(13);

    % Unit quaternion rates (Kinematic EOM)
    qdot = qrate(q, omega);

    % Angular acceleration (Dynamic EOM)
    omegadot = eulerTF(K, omega);

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
    % Omega/Mean Motion (for circular orbit)
    xdot(14) = 0;

    xdot = transpose(xdot);
end
