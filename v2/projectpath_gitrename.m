function projectpath(name, ver)
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
fname='projectpath';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
% warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% PROGRAM EXECUTION
% -------------------------------------------------------------------------

warning('Set to your own project directory');

% CHANGE DIRECTORY TO PROJECT
cd(['~/Documents/Projects/', name])

% CHANGE DIRECTORY TO SPECIFIED VERSION DIRECTORY
cd(ver);                               % cd after addpath will undo addpath

% ADD FOLDERS AND SUBFOLDERS OF SPECIFIED VERSION
addpath(genpath(['../', ver]))

% ADD PATHS FROM /utils (DOWNLOAD /utils FROM GITHUB)
addpath('../../utils/MATLAB/src/graphics/export_fig')

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
