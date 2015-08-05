function orthomatrixtest(A, b)
% Tests whether or not a square matrix is orthogonal; debugging tool
%
% Inputs
% A - 3x3 matrix, float, matrix to be tested [--]
% b - scalar/boolean, false value changes error to console message
%
% Ouput
% Use in conditional statements
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
fname='orthomatrixtest';
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

[h, l] = size(A);

% TEST: MATRIX IS SQUARE
if h ~= l
    error('Matrix is not square\n');
end

% TEST: MATRIX IS FULL RANK
if rank(A) < min([h, l])
    error('Matrix is not full rank\n');
end

% A'*A SHOULD BE IDENTITY MATRIX
test = A'*A;

warning([fname, ':TODO: Simplify'])

% PRINT MESSAGE
if b == 0
    if test ~= ones(h, l)
        disp(test)
        fprintf('Matrix is not orthogonal\n');
    end
else
    if test ~= ones(h, l)
         dis(test)
        error('Matrix is not orthogonal\n');
    end
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
