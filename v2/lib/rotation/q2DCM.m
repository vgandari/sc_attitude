function C = q2DCM(q)
% Converts a unit quaternion to a direction cosine matrix.
% The following is assumed: wdot = w*C as opposed to wdot = C*w.
% 
% Inputs
% q     - 4-vector, float, unit quaternion [--]
% 
% Outputs
% C     - 3x3 matrix, float, direction cosine matrix (orthonormal) [--]
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150429
% 

% :TODO: the next task
% :BUG: thing to fix
% :KLUDGE: why code is ugly
% :TRICKY: sleep on it before editing again
% :WARNING: be careful to/not to write code this way
% :COMPILER: compiler problems
% :ATTRIBUTE: value

% -------------------------------------------------------------------------
% !!! EDIT THESE LINES BEFORE EACH EDIT/SAVE/RUN !!!
% -------------------------------------------------------------------------
fname='q2DCM';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
% warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
    warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------

% GET SIZE OF Q
[a, b] = size(q);

% TEST: q IS A 4-VECTOR
if (a == 1 && b == 4) || (a == 4 && b == 1)
    % COMPUTE DCM
    C = [1 - 2*q(2)^2 - 2*q(3)^2,   2*(q(1)*q(2) - q(3)*q(4)),  2*(q(3)*q(1) + q(2)*q(4));
        2*(q(1)*q(2) + q(3)*q(4)),  1 - 2*q(3)^2 - 2*q(1)^2,    2*(q(2)*q(3) - q(1)*q(4));
        2*(q(3)*q(1) - q(2)*q(4)),  2*(q(2)*q(3) + q(1)*q(4)),  1 - 2*q(1)^2 - 2*q(2)^2];
else
    % ERROR IF q IS NOT A 4-VECTOR
    error('Input must be a 4-vector');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
