function dextraltest(A, b)
% Verifies that an orthonormal matrix is dextral; debugging tool
%
% Inputs
% A  - 3x3 matrix, float, matrix to be tested
% b  - scalar/boolean, use true value to suppress output if matrix s dextral
%
% Outputs
% q     - scalar/array/matrix, datatype, description [units]
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
fname='dextraltest';
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

% TEST: DETERMINANT (POSITIVE->DEXTRAL, NEGATIVE->SINISTRAL)
if det(A) == 1
    % SUPPRESS OUTPUT
    if b ~= 0
        fprintf('Matrix is dextral\n');
    end
% ERROR MESSAGES
elseif det(A) == -1
    error('Matrix is sinistral\n');
elseif det(A) == 0
    error('Matrix is singular, noninvertible\n');
else
    error('Matrix is not a rotation matrix\n');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end

