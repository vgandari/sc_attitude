function [Q, noOfDigits] = getTwoDigit(n)
  if n ~= 0
    noOfDigits = floor(log(abs(n))/log(10)) + 1;
    % floor rounds integers down to the next integer
    if 10^(noOfDigits) <= abs(n)
      noOfDigits = noOfDigits + 1;
    end
    % shift decimal point and truncate
    Q = floor(n/(10^(noOfDigits - 2)));
  else
  Q = 0;
  end
  Q = num2str(abs(Q));
end
