function f2 = f2_C(K, C, Omega)
% This function calculates the angular acceleration of a rigid body
% resulting from force of gravity. The rigid body is assumed to be in
% circular orbit with mean motion Omega = 1 rad/s. Gravity is approximated
% by a second order function assuming Earth is a point mass (i.e. uniform
% gravity field).
% This function is not suitable for use within a solver.
% 
% Inputs
% K - 3-vector, float, principal mass moment of inertia ratios [--]
% C - 3x3 matrix, float, Direction cosine matrix (left eigenvalues) [--]
% 
% Outputs
% f2 - 3-vector (col), float, angular acceleration due to gravity [?]
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
fname='f2_C';
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
[a, b] = size(C);
if (a == 3 && b == 3)
    f2 = -3*Omega^2*[K(1)*C(1, 2)*C(1, 3);
            K(2)*C(1, 3)*C(1, 1);
            K(3)*C(1, 1)*C(1, 2)];
else
    error('C must be a 3x3 matrix');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
