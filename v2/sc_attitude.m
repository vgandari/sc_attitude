% SC_ATTITUDE
% This script calls the functions necessary to simulate the rotational
% motion of a spacecraft in orbit. The user provides the necessary
% information below, before the start of the for loop, and in the functions
% sc_init and sc_batch. For updates on the assumptions, capabilities, and
% limitations of this tool, please consult the user manual. The user is
% free to add capability to this tool (e.g. EOM, plots, etc.) to suit
% his/her own needs.

close all
clear all
clc

% Include your name in all your plots
author = 'Victor Gandarillas';

% Inertia ellipsoid resolution
res = 100;

% Run simulation and save data (1), load data (2), or run simulation
% without saving or closing figures (3)
runloadsave = 2;

if ~(runloadsave == 1 || runloadsave == 2 || runloadsave == 3)
    error('Must choose between run, run and save, or load data');
end

% For plots that do not require full time history
plottime = 100;

% Choose to run/load single case (0) or batch analysis (positive array)
batch = 1:48;

% Set options for solver
options = odeset('AbsTol', 1e-12, 'RelTol', 1e-12);

% Choose experiment/EOM (eom = 1:5)
eom = 4;
exp = {'tf_EOMq', 'tf_EOMC', ... % torque free quaternion (q) or DCM (C)
    'sc_EOMC', ...               % circular orbit DCM without rotors (C)
    'sc_gyrostat_EOMC', ...         % circular orbit DCM with rotors (C)
    'sc_symmetricEOMq'};         % circular orbit symmetric spacecraft (q)

% After this, the only thing left to the user besides defining the
% spacecraft in sc_init or sc_batch is toggling plot output suppression by
% commenting/uncommenting set commands at the end of the for loop.

% Run solver and plot/record results
for testcase = batch
    % Initialize spacecraft
    [tspan, IC, file_name, region, label_x_name] = sc_init(testcase);
    
    
    % Run solver or load data
    if runloadsave ~= 2
        [time, data] = ode45(cell2mat(exp(eom)), tspan, IC, options);
    elseif runloadsave == 2
        load(horzcat(file_name, '.mat'));
    end
    
    % Save Data
    if runloadsave == 1
        save(horzcat(file_name, '.mat'), 'time', 'data');
    end
    
    % To plot shorter times than the full run (comment out for full run)
    [val, ind] = min(abs(time - plottime));
    if time(ind) < plottime
        time = time(1:ind + 1);
        data = data(1:ind + 1, :);
    else
        time = time(1:ind);
        data = data(1:ind, :);
    end
    
    % Euler Angles - OTHER ANGLES IN A FUTURE RELEASE
    nutation = acos(data(:, 15)); % euler_history(time, data(:, 7:15));
    
    
    % Graph titles
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
    
    % Plot Euler Angles
    eul = plot_sc_euler(time, nutation, 'Nutation', plotname, rotorspeed, ...
        label_x_name);
    set(gcf,'Visible','off'); % suppress output to speed up file generation
    
    % Plot Inertia ellipsoid and polhode curve
    pol = plot_sc_polhode(time, IC(1:3), data(:, 4:6), res, plotname, ...
        rotorspeed);
    set(gcf,'Visible','off'); % suppress output to speed up file generation
    
    % Save Plots as figures to edit properties later
    saveas(eul, horzcat(file_name, '_nut.fig'));
    saveas(pol, horzcat(file_name, '.fig'));
    
    % Save Plots as publishable pdfs; save_plot uses export_fig functions
    save_plot(eul, horzcat(file_name, '_nut'));
    save_plot(pol, file_name);
    
    % Clear workspace for next run
    close all
    clearvars -except author res batch options testcase
end


% TO DO
% FIX EULER_HISTORY, PLOT_EULER FOR ALL THREE ANGLES
% ADD INITIAL ORIENTATION INFORTATION TO PLOT TITLE?
% ADD MOVIE
