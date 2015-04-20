function Cdot = DCMrate(C, omega)
% This function generates a time rate of change in direction cosine matrix
% by post multiplying the current direction cosine matrix by the omega
% cross operator or affinor of rotation.
% The direction cosine matrix is assumed to be a row operator
% (i.e. wdot = w*C as opposed to wdot = C*w).
    Cdot = C*crossop(omega);
end