function f2 = f2_C(K, C, Omega)
% This function calculates the angular acceleration of a rigid body
% resulting from force of gravity. The rigid body is assumed to be in
% circular orbit with mean motion Omega = 1 rad/s. Gravity is approximated
% by a second order function assuming Earth is a point mass (i.e. uniform
% gravity field).
% This function is not suitable for use within a solver.
% K - principal mass moment of inertia ratios
% C - Direction cosine matrix (row operator)
% f2 - angular acceleration resulting from gravity (column vector)
    [a, b] = size(C);
    if (a == 3 && b == 3)
        f2 = -3*Omega^2*[K(1)*C(1, 2)*C(1, 3);
                K(2)*C(1, 3)*C(1, 1);
                K(3)*C(1, 1)*C(1, 2)];
    else
        error('C must be a 3x3 matrix');
    end
end