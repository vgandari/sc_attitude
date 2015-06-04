function main()
% Runs sc_attitude, v2
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150509
% 
% :TODO: Define functions called
% :TODO: MAKE THIS OBJECT ORIENTED

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
fname='main';
error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% SET PROJECT PATH
% -------------------------------------------------------------------------
projectpath('sc_attitude', 'v2')                         % assume v1 unused

% -------------------------------------------------------------------------
% USER INPUTS
% -------------------------------------------------------------------------

% SET TO RUN/LOAD
% 0 - load data, do not run cases (meant for plotting)
% 1 - run simulation for each case specified
run = 1;

% SET SIMULATION RUNTIME [s]
runtime = [0, 100];

% SET OVERWRITE FLAG
% 0 - do not run cases with existing data
% 1 - overwrite existing data
overwrite = 1;                                       % no effect if run = 0

% SET PLOTTING TO SCREEN ON/OFF
% 0 - suppress printing figures to screen
% 1 - print plots to screen
plotOut = 0;

% SET PLOTTIME INTERVAL
plotTime = [0, 100];

% 3D PLOT RESOLUTION
res3D = 100;

% INCLUDE AUTHOR NAME IN PLOTS
author = 'Victor Gandarillas';

% SET LOAD CASES (DATA FILES TO LOAD - I.E. PREVIOUS OUTPUT)
loadCases = {''};

% SET RUN CASES (CONDITIONS TO SIMULATE - I.E. USER DEFINED INPUT)
runCases = {''};

% SET OUTPUT DATA FOLDER
% 0 - default /utils directory
% 1 - local directory (outside Git repository)
% 2 - specify other directory (string)
writeDir = 1;

% SELECT MODEL/EOM
% CHOOSE EOM (NUMBER) FROM LIST OF EOM FUNCTION NAMES (/MODELS)
% Choose experiment/EOM (eom = 1:5)
eom = 4;
exp = {'tf_EOMq', 'tf_EOMC', ... % torque free quaternion (q) or DCM (C)
    'sc_EOMC', ...               % circular orbit DCM without rotors (C)
    'sc_gyrostat_EOMC', ...         % circular orbit DCM with rotors (C)
    'sc_symmetricEOMq'};         % circular orbit symmetric spacecraft (q)


% SET OPTIONS FOR SOLVER (ODE45)
options = odeset('AbsTol', 1e-12, 'RelTol', 1e-12);

% -------------------------------------------------------------------------
% INITIALIZE AND RUN SIMULATION
% -------------------------------------------------------------------------

% SET RUN OPTIONS
runOptions(run, overwrite)

% SET PLOT OPTIONS
plotOptions(plotOut, plotTime, author)

% SET INPUT/OUTPUT DATA SOURCES/DESTINATIONS
dataOptions(loadCases, runCases, writeDir)

% SET SOLVER OPTIONS
solverOptions(options, IC)

% CHECK INPUTS
simCheck()

% INITIALIZE SIMULATION
simInit()

% RUN SIMULATION
runSim()

% -------------------------------------------------------------------------
% DATA OPTIONS
% -------------------------------------------------------------------------

% default runCases locations - no test for existence, no mkdir
runCasesLocation = '~/Documents/Projects/sc_attitude/v2/data/run';
runCasesLocation = '~/Documents/Projects/localdata/sc_attitude/v2/out';

% default loadCases locations - no test for existence, no mkdir
loadCasesLocation = '~/Documents/Projects/sc_attitude/v2/usr/data';
loadCasesLocation = '~/Documents/Projects/localdata/sc_attitude/v2/in';

% -------------------------------------------------------------------------
% ORIGINAL CODE
% -------------------------------------------------------------------------

runloadsave = 2;

% :TODO: CHANGE TO SET RUNTIME LIMIT, NOT LIMIT ON DATA SELECTED FOR
% PLOTTING (GENERATE FLAG ONLY)
% SET TIME LIMIT FOR PLOTS
% runtime = 100;
plottime = 100;

% SINGLE CASES (0) VS BATCH ANALYSIS (ARRAY) DEFINED IN dataOptions()
testCaseSet = 1:48;

% RUN SIMULATION FOR TEST CASES SPECIFIED
for testCase = testCaseSet;
    % :TODO: CHOOSE CORRECT FUNCTION CALL
    % INITIALIZE SPACECRAFT BASED ON CASES DEFINED IN dataOptions()
    [tspan, IC, file_name, region, label_x_name] = dataOptions(testCase);
    
    % :TODO: VERIFY ODE45 CALL
    % RUN/LOAD (BASED ON FLAG VALUE)
    if run ~= 0
        [time, data] = ode45(cell2mat(exp(eom)), tspan, IC, options);
    else
        load(horzcat(file_name, '.mat'));
    end
    
    % SAVE DATA
    save(horzcat(file_name, '.mat'), 'time', 'data');
    
    % :KLUDGE:
    % To plot shorter times than the full run (comment out for full run)
    [val, ind] = min(abs(time - plottime));
    if time(ind) < plottime
        time = time(1:ind + 1);
        data = data(1:ind + 1, :);
    else
        time = time(1:ind);
        data = data(1:ind, :);
    end
    
    % :TODO: EULER ANGLES
    nutation = acos(data(:, 15)); % euler_history(time, data(:, 7:15));
    
    % :TODO: MAKE A setTitle FUNCTION
    % SET GRAPH TITLES
                                                                             {
    if eom ~= 5
        omega0 = IC(4:6);
    else
        omega0 = IC(2:4);
    end
    
    if eom == 4
        s0 = IC(29:31);
    else
        s0 = [0, 0, 0];
    end
    
    [plotname, rotorspeed] = graph_titles(author, region, ...
        label_x_name, omega0, s0);
                                                                             }
    
    
                                                                             {
    % PLOT
    % Plot Euler Angles
    eul = plot_sc_euler(time, nutation, 'Nutation', plotname, rotorspeed, ...
        label_x_name);
    set(gcf,'Visible','off'); % suppress output to speed up file generation
    
    % Plot Inertia ellipsoid and polhode curve
    pol = plot_sc_polhode(time, IC(1:3), data(:, 4:6), res3D, plotname, ...
        rotorspeed);
    set(gcf,'Visible','off'); % suppress output to speed up file generation
                                                                             }
    
    
    % :TODO: SUPPRESS OUTPUT, TEST EXISTENCE OF FILES (OVERWRITE FLAG)
    % SAVE PLOTS
    % Save Plots as figures to edit properties later
    saveas(eul, horzcat(file_name, '_nut.fig'));
    saveas(pol, horzcat(file_name, '.fig'));
    
    % Save Plots as publishable pdfs; save_plot uses export_fig functions
    save_plot(eul, horzcat(file_name, '_nut'));
    save_plot(pol, file_name);
end


% TO DO
% FIX EULER_HISTORY, PLOT_EULER FOR ALL THREE ANGLES
% ADD INITIAL ORIENTATION INFORTATION TO PLOT TITLE?
% ADD MOVIE


% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
