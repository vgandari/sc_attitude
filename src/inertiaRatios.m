function K = inertiaRatios(I)
  K = [(I(2) - I(3))/I(1);
       (I(3) - I(1))/I(2);
       (I(1) - I(2))/I(3)];
end
