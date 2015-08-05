function q = DCM2q(C)
% Transforms a direction cosine matrix to a unit quaternion.
% The following is assumed: wdot = w*C as opposed to wdot = C*w.
% 
% Inputs
% C     - 3x3 matrix, float, direction cosine matrix (orthonormal) [--]
% 
% Outputs
% q     - 4-vector (row), float, unit quaternion [--]
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
fname='DCM2q';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
    warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------

% UNIT QUATERNION
q = zeros(1, 4);
    q(4) = 1/2*sqrt(1 + C(1, 1) + C(2, 2) + C(3, 3));
    q(1) = (C(3, 2) - C(2, 3))/(4*q(4));
    q(2) = (C(1, 3) - C(3, 1))/(4*q(4));
    q(3) = (C(2, 1) - C(1, 2))/(4*q(4));

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
