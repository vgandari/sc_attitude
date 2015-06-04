function wx = crossop(w)
% Generates a cross operator from a given 3-vector. It is meant for writing
% cross products as matrix-vector multiplications.
% 
% Inputs
% w     - 3-vector, float
% 
% Outputs
% wx    - 3x3 matrix, float, cross operator corresponding to w
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
fname='crossop';
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
wx = [0    -w(3)  w(2);
    w(3)  0    -w(1);
    -w(2)  w(1)  0];

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
