function Ldot = DCMrateR(L, omega)
% Generates a time rate of change in direction cosine matrix
% by pre multiplying the current direction cosine matrix by the omega
% cross operator. The following is assumed: wdot = L*w as opposed to
% wdot = w*L.
% 
% Inputs
% L     - 3x3 matrix, float, direction cosine matrix (orthonormal) [--]
% omega - 3-vector, float
% 
% Outputs
% Ldot  - 3x3 matrix, float, rate of change of direction cosine matrix [--]
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
fname='DCMrateL';
% error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
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

% PRE MULTPLY OMEGA CROSS OPERATOR
Ldot = crossop(omega)'*L;

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
