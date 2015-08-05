% -------------------------------------------------------------------------
% CLEAR WORKSPACE
% -------------------------------------------------------------------------
clear all

% -------------------------------------------------------------------------
% SET PROJECT PATH
% -------------------------------------------------------------------------
mypath = projectpath('simUtils');

% -------------------------------------------------------------------------
% CONFIGURATION
% -------------------------------------------------------------------------

% 3D PLOT RESOLUTION
resolution = 100;

% INCLUDE AUTHOR NAME IN PLOTS (empty string for title only)
author = 'Victor Gandarillas';

% SET TO RUN/LOAD
% 0 - load previously run data and plot
% 1 - run simulation and generate data
run = 1;

% SET SIMULATION RUNTIME [s]
tspan = [0, 100];

% SET OVERWRITE FLAG
% 0 - do not run cases with existing data
% 1 - overwrite existing data (run = 1 only)
overwriteData = 0;
overwritePlots = 1;

% SET OUTPUT DATA FOLDER (load from and plot/run and save to)
% 0 - default /data directory
% 1 - local directory (outside Git repository)
% 2 - specify other directory (string)
dataDir = [mypath '/src/usr/data/data/'];
plotDir = [mypath '/src/usr/data/plots/'];
movDir = [mypath '/src/usr/data/animations/'];

% SET PLOTTING TO SCREEN ON/OFF; Movies always play on screen
% 0 - suppress printing figures to screen (recommended for large data sets)
% 1 - print plots to screen
plotOut = 0;

% -------------------------------------------------------------------------
% INITIAL CONDITIONS AND MODEL SELECTION
% -------------------------------------------------------------------------

% Initial conditions, put in separate file to generate large sets
q = [ 0; 0; 0; 1];
w = [1; 3; 2];
I = [1000; 200; 70];
K = inertiaRatios(I);
Omega = 2*pi;
IC = [q; w; I; K; Omega];
IC = transpose(IC);

% SET INITIAL CONDITIONS TO RUN OR SEARCH FOR IN EXISTING DATA
initialConditions = {};
%{
for i = 1:96
  initialConditions{1, i} = sc_init(i);
end

break
%}

% USES SINGLE SET OF ICs ABOVE IF EMPTY (for easy switching between single
% and batch runs)
if isempty(initialConditions)
    initialConditions  = {IC};
end

clear q w I K Omega

% Index of first constant in IC array (> length(IC) if no constants)
constantsBegin = 8;

% SELECT MODEL/EOM - include in fileName for future models
eom = 'tf_EOMq';

% SOLVER OPTIONS
options = odeset('AbsTol', 1e-12, 'RelTol', 1e-12);

% -------------------------------------------------------------------------
% BATCH PROCESS
% -------------------------------------------------------------------------
for i = 1:length(initialConditions)
  IC = cell2mat(initialConditions(i));
  fileName = sc_fileName(IC);
  if run ~= 0
      % -------------------------------------------------------------------
      % RUN SIMULATION
      % -------------------------------------------------------------------

      [time, data] = ode45(eval(['@' eom]), tspan, IC, options);
      saveData([dataDir fileName], overwriteData)
  else
      % -------------------------------------------------------------------
      % LOAD SIMULATION DATA
      % -------------------------------------------------------------------
      if exist([dataDir fileName '.mat']) == 2
      load([dataDir fileName '.mat']);
      end
  end

  % -----------------------------------------------------------------------
  % GENERATE PLOTS
  % -----------------------------------------------------------------------
  % VISUAL CHECK OF STABILITY REGION
  %plotScStab(IC)
  %savePlot(['stability_' fileName], overwritePlots)

  plotName = sc_graph_title(IC);
  plotName = [author '-' plotName];
  % plotSubHeader meant for rotor speeds
  plot_sc_polhode(time, data, [0 0 1], 0, resolution, plotOut, plotName); %, plotSubHeader)
  %savePlot([plotDir fileName], overwritePlots)

  % poincare maps
  %poincareMap(data(:, 5), data(:, 6), data(:, 7), n, 0.1, 0)
  %savePlot([plotDir fileName], overwritePlots) % change filename for poincare maps


  % -----------------------------------------------------------------------
  % GENERATE AND SAVE MOVIE
  % -----------------------------------------------------------------------
  generateMovie(time, data, resolution, plotOut, plotName, fileName)

  close all
end





