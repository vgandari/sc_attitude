function region = sc_regionI(I)
% Calculates stability region of a spacecraft from inertia properties.
% Regions 2-6 guarantee unstable rotational motion.

switch I
    case I(3) > I(2) && I(2) > I(1)
        region = 1;
    case I(3) > I(1) && I(1) > I(2)
        region = 2;
    case I(1) > I(3) && I(3) > I(2)
        region = 3;
    case I(1) > I(2) && I(2) > I(3)
        region = 4;
    case I(2) > I(1) && I(1) > I(3)
        K1 = (I(2) - I(3))/I(1);
        K2 = (I(3) - I(1))/I(2);
        if (1 - K1*K2 + 3*K2)^2 + 16*K1*K2 < 0
            region = 5;
        else
            region = 7;
        end
    case I(2) > I(3) && I(3) > I(1)
        region = 6;
end

    