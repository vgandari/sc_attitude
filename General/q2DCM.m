function C = q2DCM(q)
% This function converts a unit quaternion to a direction cosine matrix.
% The direction cosine matrix is output as a row operator
% (i.e. wdot = w*C as opposed to wdot = C*w).
    [a, b] = size(q);
    
    if (a == 1 && b == 4) || (a == 4 && b == 1)
        C = [1 - 2*q(2)^2 - 2*q(3)^2,   2*(q(1)*q(2) - q(3)*q(4)),  2*(q(3)*q(1) + q(2)*q(4));
            2*(q(1)*q(2) + q(3)*q(4)),  1 - 2*q(3)^2 - 2*q(1)^2,    2*(q(2)*q(3) - q(1)*q(4));
            2*(q(3)*q(1) - q(2)*q(4)),  2*(q(2)*q(3) + q(1)*q(4)),  1 - 2*q(1)^2 - 2*q(2)^2];
    else
        error('Input must be a 4-vector');
    end
end



% The direction cosine matrix is output as a column operator
% (i.e. wdot = C*w as opposed to wdot = w*C).