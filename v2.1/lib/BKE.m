function qdotn = BKE(qb, qdotb, omega)
% Basic Kinematic Equaiton. Calculates rate of change of a vector in a
% different reference frame
%
% Inputs
% qb    - 3-vector, float, vector in reference frame B
% qdotb - 3-vector, float, time rate of change od qb wrt reference frame B
%
% Outputs
% qdotn - 3-vector, float, time rate of change od qb wrt reference frame N
% omega - 3-vector, float, rotation rate of frame B wrt frame N [rad/s]
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
fname='BKE';
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

% BASIC KINEMATIC EQUATION
qdotn = qdotb + cross(omega, qb);

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end