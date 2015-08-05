function generateMovie(time, data, resolution, plotOut, plotname, fileName)
% generates and saves movie
loops = length(time);
%pFrame(loops) = struct('cdata',[],'colormap',[], 'Units', []);
% generate frames
for i = 20:30
  % set up rotation axis angle
  if length(data) <= 14
    [lambda, theta] = q2simple(data(1:4))
  else
    C = [data(15:17); data(18:20); data(21:23)];
    [lambda, theta] = DCM2simple(C)
  end

  % plot polhode
  plot_sc_polhode(time(i), data(i, :), lambda, theta, resolution, plotOut, plotname);
  %g = plot(time(1:i), data(1:i));
  % n - figure number
  set(gcf, 'visible', 'off')
  %drawnow
  pFrame(i) = getframe(gcf);
  %fig = figure;
  close gcf
end

% convert to avi
maxDuration = 30; % seconds
if loops/maxDuration > maxDuration
  fps = floor(loops/30);
else
  fps = 15;
end
%warning(horzcat([fileName '.avi'], 'will be overwritten'));
movie2avi(pFrame, [fileName '.avi'], 'compression', 'None', 'fps', fps);
end




