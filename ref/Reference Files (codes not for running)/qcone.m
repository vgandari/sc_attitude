% Calculates Euler parameters to convert from N frame to B frame in terms
% of intermediate frame c for freely rotating body.

function q = qcone(phi, p, s, t)
    q = [cos(phi).*sin(p*t/2).*cos(s*t/2) + cos(p*t/2).*sin(s*t/2);
        -sin(phi).*sin(s*t/2).*sin(p*t/2);
        -sin(phi).*sin(p*t/2).*cos(s*t/2);        
        cos(p*t/2).*cos(s*t/2) - cos(phi).*sin(p*t/2).*sin(s*t/2)];
end