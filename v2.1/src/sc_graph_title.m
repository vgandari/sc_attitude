function [plotHeader, plotSubHeader] = sc_graph_titles(IC)

% GET INDEX OF LARGEST COMPONENT OF OMEGA
ind_omega0_max = logical(max(IC(5:7)) == IC(5:7));

% DEFINE LABELS DEPENDING ON ROTATION ABOUT EACH AXIS IN ORBIT FRAME
orbitaxis = {'radial', 'tangent', 'normal'};

% DEFINE PLOT NAME (AUTHOR, REGION, RADIAL/TANGETNTIAL/NORMAL)
plotHeader = horzcat('Region ', num2str(1), ...
    ' SC (about orbit ', orbitaxis{ind_omega0_max}, ')');

if length(IC) > 14
  % TEST: ROTATION SPEEDS NONDIMENSIONALIZED
  if IC(14) == 2*pi
      % DEFINE ROTOR SPEED LABEL
      plotSubHeader = horzcat('s_1 = ', num2str(s0(1)/(2*pi)), ', s_2 = ', ...
      num2str(s0(2)), ', s_3 = ', num2str(s0(3)/(2*pi)));
  else
      % DEFINE ROTOR SPEED LABEL
      plotSubHeader = horzcat('s_1 = ', num2str(s0(1)), ', s_2 = ', ...
      num2str(s0(2)), ', s_3 = ', num2str(s0(3)));
  end
end

end
