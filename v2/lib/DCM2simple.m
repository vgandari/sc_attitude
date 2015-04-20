function [lambda, theta] = DCM2simple(C)
% This function converts a direction cosine matrix to an axis-angle
% representation of rotation.
% The direction cosine matrix is assumbed to be a row operator
% (i.e. wdot = w*C as opposed to wdot = C*w) and lambda is output as a row
% vector.
% theta is in radians.
%     [v, lam] = eig(C);
%     lam = (lam - 1).^2;
%     [Y, ind] = min(lam);
%     clear Y
%     lambda = v(:, ind)';
    [lambda, theta] = q2simple(DCM2q(C));
end