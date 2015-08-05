function [Q, noOfDigits] = getFirstDigits(P, n)
  if P ~= 0
    noOfDigits = floor(log(abs(P))/log(10)) + 1;
    % floor rounds integers down to the next integer
    if 10^(noOfDigits) <= abs(P)
      noOfDigits = noOfDigits + 1;
    end
    % shift decimal point and truncate
    Q = floor(P/(10^(noOfDigits - n)));
  else
  Q = 0;
  end
  Q = num2str(abs(Q));
end
