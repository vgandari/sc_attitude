function [T0T, rho0rho, p0p] = isen(k, M)
    T0T = 1 + (k - 1)/2*M.^2;
    rho0rho = T0T.^(1/(k - 1));
    p0p = T0T.^(k/(k - 1));
end