function savePlot(fileName, overwritePlot)

fileName = fileName(1:length(fileName) - 4);
if ~(exist([fileName '.eps']) == 2)
    print2eps([fileName '.eps'])
  elseif overwritePlot
    print2eps([fileName '.eps'])
    fprintf(['Plot overwitten: ' [fileName '.eps'] '\n']);
  end

if ~(exist([fileName '.pdf']) == 2)
    eps2pdf([fileName '.eps'], [fileName '.pdf'])
  elseif overwritePlot
    eps2pdf([fileName '.eps'], [fileName '.pdf'])
    fprintf(['Plot overwitten: ' [fileName '.pdf'] '\n']);
  end
end
