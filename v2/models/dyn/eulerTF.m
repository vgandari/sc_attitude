function omegadot = eulerTF(K, omega)
% This function calculates the instantaneous angular acceleration of a
% rotating rigid body in a torque-free environment. It should not be called
% by a solver.
% 
% Inputs
% K         - 3-vector, float, principal mass moment of inertia ratios [--]
% omega     - 3-vector, float, angular velocity [rad/s]
% 
% Outputs
% omegadot  - 3-vector (col), float, angular acceleration [rad/s^2]
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
fname='ftemplate';
error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
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
if length(omega) == 3 && length(K) == 3
    omegadot = [K(1)*omega(2)*omega(3);
                K(2)*omega(3)*omega(1);
                K(3)*omega(1)*omega(2)];
else
    error('omega must be a 3-vector');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
