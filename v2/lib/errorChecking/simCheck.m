function [q] = simCheck(p)
% Function description
% 
% Inputs
% p     - scalar/array/matrix, datatype, description [units]
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
fname='simCheck';
error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------
% ERROR CHECK FLAGS
if ~(runloadsave == 1 || runloadsave == 2 || runloadsave == 3)
    error('Must choose between run, run and save, or load data');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
