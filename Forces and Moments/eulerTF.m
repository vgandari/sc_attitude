function omegadot = eulerTF(K, omega)
% This function calculates the instantaneous angular acceleration of a
% rotating rigid body in a torque-free environment. It should not be called
% by a solver.
% K - principal mass moment of inertia ratios
% omega - angular velocity
% omegadot - angular acceleration, ruetunred as a column vector
    if length(omega) == 3 && length(K) == 3
        omegadot = [K(1)*omega(2)*omega(3);
                    K(2)*omega(3)*omega(1);
                    K(3)*omega(1)*omega(2)];
    else
        error('omega must be a 3-vector');
    end
end