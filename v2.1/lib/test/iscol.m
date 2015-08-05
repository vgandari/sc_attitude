function col = iscol(v)
% Tests whether or not a vector is a column vector; debugging
% If the function is a column vector, a 1 is returned.
% If the function is a row vector, a 0 is returned.
% The function returns an error if v is not a vector.
%
% Inputs
% v     - vector
%
% Outputs
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
fname='iscol';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
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

[a, b] = size(v);
if a == 1 || b == 1
    if a < b
        col = 0;
    else
        col = 1;
    end
else
    error('v must be a vector');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
