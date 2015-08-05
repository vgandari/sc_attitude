function q = signBool(x)
    x = x./abs(x);
    a = x.^2;
    c = zeros(1, length(x));
    for i = 1:length(x)
      if x(i) ~= a(i)
        c(i) = 0;
      else
        c(i) = 1;
      end
    end
    q = [];
    for i = 1:length(c)
      q = [q num2str(c(i))];
    end
end
