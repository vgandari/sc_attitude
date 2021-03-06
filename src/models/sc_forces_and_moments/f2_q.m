function f2 = f2_q(K, q,Omega)
% This function calculates the angular acceleration of a rigid body
% resulting from force of gravity. The rigid body is assumed to be in
% circular orbit with mean motion Omega = 1 rad/s. Gravity is approximated
% by a second order function assuming Earth is a point mass (i.e. uniform
% gravity field).
% This function is not suitable for use within a solver.
% K - principal mass moment of inertia ratios
% q - unit quaternion expressing orientation of bidy with respect to orbit
%     frame
% f2 - angular acceleration resulting from gravity (column vector)
    if length(q) == 4
        f2 = -3*Omega^2* ...
            [K(1)*(2*(q(1)*q(2) - q(3)*q(4)))*(2*(q(3)*q(1) + q(2)*q(4)));
             K(2)*(2*(q(3)*q(1) + q(2)*q(4)))*( 1 - 2*q(2)^2 - 2*q(3)^2 );
             K(3)*( 1 - 2*q(2)^2 - 2*q(3)^2 )*(2*(q(1)*q(2) - q(3)*q(4)))];
    else
        error('q must be a 4-vector');
    end
%     C = [1 - 2*q(2)^2 - 2*q(3)^2,   2*(q(1)*q(2) - q(3)*q(4)),  2*(q(3)*q(1) + q(2)*q(4));
end