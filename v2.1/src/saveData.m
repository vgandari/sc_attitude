function saveData(fileName, overwriteData)
  if ~(exist(fileName) == 2)
    save(fileName)
  elseif overwriteData
    save(fileName)
    fprintf(['Data overwitten: ' fileName '\n']);
  end
end
