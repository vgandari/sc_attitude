function [lambda, theta] = DCM2simple(C)
% Converts a direction cosine matrix to an axis-angle
% representation of rotation. The following is assumed: wdot = w*C as
% opposed to wdot = C*w.
% 
% Inputs
% C     - 3x3 matrix, float, direction cosine matrix (orthonormal) [--]
% 
% Outputs
% lambda - 4-vector (row), float, axis of rotation [--]
% theta  - scalar, float, angle of rotation [rad]
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150429
% 
% :TODO:
% Uncomment error line
% Complete header
% Write function
% Add error checking code

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
fname='DCM2simple';
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

% GENERATE QUATERNIONS FROM DCM AND CONVERT QUATERNION TO SIMPLE AXIS/ANGLE
[lambda, theta] = q2simple(DCM2q(C));

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
