function [tspan, IC, file_name, region, label_x_name] = simInit(testcase)
% Initializes spacecraft for sc_attitude simulation
% Choose batch = 0 in sc_attitude for a single run (define ICs here) or
% define batch as an array of test cases (test cases and test case
% selection defined in sc_batch).
% 
% Based on sc_init
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
fname='simInit';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);
warning(['TODO: Update', fname])

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------
% if testcase == 0 % single run

    %    ----OLD----
    % Define Orbit Mean Motion (CIRCULAR ORBIT)
%     Omega = 1; % [rev/s]; if 1 rev/s, "No. of orbits [--]" xlabel
%     Omega = 2*pi*Omega; % convert to [rad/s]
    % Mass Properties
    % K required for tf_EOMC, tf_EOMq
    % X = 1 - J/I required for sc_symmetricEOMq, where J is axial
    % moment of inertia
    % I required for gyrostat_EOMC
%     I = zeros(1, 3);
%     I(1) = 200;
%     I(2) = 1000;
%     I(3) = 1100;

    % INITIAL ORIENTATION
    C0 = [0.9924, -0.0868, 0.0872;
          0.0944, 0.9917, -0.0868;
         -0.0789, 0.0944, 0.9924];          % left eigenvalues (wdot = w*C)

    % q0 = [0, 0, 0, 1];                         % input quaternion instead
    % C0 = q2DCM(q0);

    % Initial Angular Velocity
    omega0 = [0.1, 0.1, 1.1]; % [--], [rev of omega]/[rev of Omega]
    omega0 = omega0*Omega; % [rad/s]

    % Rotor Properties
    % Axial moments of inertia (elements equal to zero sufficient to
    % "turn off" rotors)
    J = [0, 0, 50];

    % ROTOR ORIENTATIONS
    b10 = [1, 0, 0];
    b20 = [0, 1, 0];
    b30 = [0, 0, 1];

    % ROTOR SPIN RATES
    s0 = [0, 0, -100*Omega];
    
    % INITIAL CONTITIONS
    IC = [I, omega0, C0(1, :), C0(2, :), C0(3, :), Omega, ...
          J, b10, b20, b30, s0];


    % DETERMINE STABILITY REGION FROM MASS PROPERTIES
    region = sc_regionI(I);                  % based on moments of inertia
    % region = sc_regionK(K);           % based on moment of inertia ratios

    
    % CHOOSE TIME VS NO. OF ORBITS AS X-AXIS UNITS
    if Omega == 2*pi
        label_x_name = 'No. of Orbits [--]';
    else
        label_x_name = 'Time [s]';
    end
else % batch runs
    [tspan, IC, file_name, region, label_x_name] = sc_batch(testcase);
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end