function q = simple2q(lambda, theta)
% Converts a rotation represented simply by an axis and an angle to a
% unit quaternion.
%
% Inputs
% lambda  - 3-vector, float, axis of rotation [--]
% theta   - scalar, float, angle of rotation [rad]
%
% Outputs
% q     - 4-vector, float, unit quaternion [--]
%
% Victor Gandarillas
% gandarillasv@gmail.com
%
% Last Updated: 20150501
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
fname='simple2q';
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

warning([fname, ':TODO: USE iscol(), isrow()']);

% GET SIZE OF lambda
[a, b] = size(lambda);
if (a == 1 && b ==3) || (a == 3 && b == 1)
    if a > b
        % FIND q IF lambda IS A COLUMN VECTOR
        q = [lambda*sin(theta/2); cos(theta/2)];
    else
        % FIND q IF lambda IS A ROW VECTOR
        q = [lambda*sin(theta/2), cos(theta/2)];
    end
else
    error('lambda must be a 3-vector');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
