function C = simple2DCM(lambda, theta)
% Converts a rotation represented simply by an axis and an angle to a
% direction cosine matrix.
% 
% Inputs
% lambda  - 3-vector, float, axis of rotation [--]
% theta   - scalar, float, angle of rotation [rad]
% 
% Outputs
% C       - 3x3 matrix, float, direction cosine matrix [--]
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150503
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
fname='simple2DCM';
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

% IDENTITY MATRIX
I = eye(3, 3);

% DIRECTION COSINE MATRIX (SOME TERMS DEPEND ON IDENTITY MATRIX)
C = I*cos(theta) - I*crossop(lambda)*sin(theta) + ...
    [lambda(1); lambda(2); lambda(3)]* ...
    [lambda(1), lambda(2), lambda(3)]* ...
    (1 - cos(theta));

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
