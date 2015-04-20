function C = simple2DCM(lambda, theta)
% This function converts a rotation represented simply by an axis and an
% angle to a direction cosine matrix.
% The direction cosine matrix is output as a row operator
% (i.e. wdot = w*C as opposed to wdot = C*w).
    U = eye(3, 3);
    C = U*cos(theta) - U*crossop(lambda)*sin(theta) + ...
        [lambda(1); lambda(2); lambda(3)]* ...
        [lambda(1), lambda(2), lambda(3)]* ...
        (1 - cos(theta));
end