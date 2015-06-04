function xdot = tf_EOMq(t, x)
% EOM for a rigid body in torque free environment. Orientation defined by
% quaternions.
    
    % Initialize variables
    K = zeros(1, 3);
    omega = zeros(1, 3);
    q = zeros(1, 4);
    
    % Inertia properties - constant
    K(1) = x(1);
    K(2) = x(2);
    K(3) = x(3);
    
    % Angular velocity
    omega(1) = x(4);
    omega(2) = x(5);
    omega(3) = x(6);
    
    % Unit quaternion
    q(1) = x(7);
    q(2) = x(8);
    q(3) = x(9);
    q(4) = x(10);
    
    % Angular acceleration (Dynamic EOM)
    omegadot = eulerTF(K, omega);
    
    %Unit quaternion rates (Kinematic EOM)
    qdot = qrate(q, omega);
    
    % Store state variables
    xdot(1) = 0;
    xdot(2) = 0;
    xdot(3) = 0;
    xdot(4) = omegadot(1);
    xdot(5) = omegadot(2);
    xdot(6) = omegadot(3);
    xdot(7) = qdot(1);
    xdot(8) = qdot(2);
    xdot(9) = qdot(3);
    xdot(10) = qdot(4);
    
    xdot = transpose(xdot);
end