function q13 = succrot_q(q12, q23)
% Calculates a quaternion for two successive rotations
%
% Inputs
% q12 - 4-vector, float, quaternion corresponding to first rotation
% q23 - 4-vector, float, quaternion corresponding to second rotation
%
% Outputs
% q13 - 4-vector, float, quaternion for both rotations combined
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
fname='succrot_q';
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

q13(1:3, 1) = q12(1:3, 1)*q23(4) + q23(1:3, 1)*q12(4) + cross(q23(1:3, 1), q12(1:3, 1));
q13(4) = q12(4)*q23(4) - dot(q12(1:3, 1), q23(1:3, 1));

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
