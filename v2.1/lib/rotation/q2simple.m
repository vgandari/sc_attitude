function [lambda, theta] = q2simple(q)
% Converts a unit quaternion to a simple axis-angle representation.
% 
% Inputs
% q     - 4-vector (row), float, unit quaternion [--]
% 
% Outputs
% lambda - 4-vector (row), float, axis of rotation [--]
% theta  - scalar, float, angle of rotation [rad]
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150425
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
fname='q2simple';
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

theta = 2*acos(q(4));
lambda = q(1:3)/sin(theta/2);

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
