function [plotname, rotorspeed] = sc_graph_titles(author, region, ...
    label_x_name, omega0, s0)
% Generates graph titles for sc_attitude batch analysis
% 
% Inputs
% author        - string, name of author
% region        - int, defines ratios of moments of inertia
% label_x_name  - string, dependednt on units of omega0, s0 [rad/s vs --]
% omega0        - 3-vector, initial angular velocity of spacecraft
% s0            - 3-vector, initial angular velocity of stabilizing rotors
% 
% Outputs
% q     - scalar/array/matrix, datatype, description [units]
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
fname='sc_graph_titles';
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

% GET INDEX OF LARGEST COMPONENT OF OMEGA
ind_omega0_max = logical(max(omega0) == omega0);

% DEFINE LABELS DEPENDING ON ROTATION ABOUT EACH AXIS IN ORBIT FRAME
orbitaxis = {'radial', 'tangent', 'normal'};

% DEFINE PLOT NAME (AUTHOR, REGION, RADIAL/TANGETNTIAL/NORMAL)
plotname = horzcat(author, ' - Region ', num2str(region), ...
    ' SC (about orbit ', orbitaxis{ind_omega0_max}, ')');

warning(':TODO: DEFINE label_x_axis EXTERNALLY');
% TEST: ROTATION SPEEDS NONDIMENSIONALIZED
if strcmp(label_x_name, 'No. of Orbits [--]')
    % DEFINE ROTOR SPEED LABEL
    rotorspeed = horzcat('s_1 = ', num2str(s0(1)/(2*pi)), ', s_2 = ', ...
    num2str(s0(2)), ', s_3 = ', num2str(s0(3)/(2*pi)));
else
    % DEFINE ROTOR SPEED LABEL
    rotorspeed = horzcat('s_1 = ', num2str(s0(1)), ', s_2 = ', ...
    num2str(s0(2)), ', s_3 = ', num2str(s0(3)));
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
