function q = DCM2q(C)
% This function transforms a direction cosine matrix to a unit quaternion.
% The direction cosine matrix is assumed to be a row operator
% (i.e. wdot = w*C as opposed to wdot = C*w).
% The unit quaternion is output as a row vector.
    q = zeros(1, 4);
    q(4) = 1/2*sqrt(1 + C(1, 1) + C(2, 2) + C(3, 3));
    q(1) = (C(3, 2) - C(2, 3))/(4*q(4));
    q(2) = (C(1, 3) - C(3, 1))/(4*q(4));
    q(3) = (C(2, 1) - C(1, 2))/(4*q(4));
end


% The direction cosine matrix is assumed to be a column operator
% (i.e. wdot = C*w as opposed to wdot = w*C).