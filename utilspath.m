function utilspath()
% Sets path for project files
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150509
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
fname='utilspath';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
% warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% VARIABLE INITIALIZATION
% -------------------------------------------------------------------------

% :REMINDER: PROJECT NAME MUST BE SPECIFIED IN "PROGRAM EXECUTION" SECTION

% -------------------------------------------------------------------------
% PROGRAM EXECUTION
% -------------------------------------------------------------------------

% CHANGE DIRECTORY TO PROJECT
cd('~/Documents/Projects/utils/MATLAB')

% ADD FOLDERS AND SUBFOLDERS OF SPECIFIED VERSION
addpath(genpath('../'));

% -------------------------------------------------------------------------
% OUTPUT DATA
% -------------------------------------------------------------------------

disp(pwd)

% -------------------------------------------------------------------------
% END OF SCRIPT
% -------------------------------------------------------------------------
end
