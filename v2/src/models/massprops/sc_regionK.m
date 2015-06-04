function region = sc_regionK(K)
% Calculates stability region of a spacecraft from mass property ratios.
% Regions 2-6 guarantee unstable rotational motion.

    if (K(1) == 0 && K(3) == 0 && K(2) ~= 0) || ...
            (K(2) == 0 && K(3) == 0 && K(1) ~= 0)
        error('Invalid mass properties (one or three ratios may be zero');
    end
    
    if K(3) < 0
        if K(2) > 0
            region = 2;
        elseif K(1) > 0
            region = 4;
        elseif K(2) == 0 && K(1) ~= 0
            region = 3;
            warning('Spacecraft symmetric about I2, R3 chosen');
        elseif K(1) == 0 && K(2) ~= 0
            region = 3;
            warning('Spacecraft symmetric about I1, R3 chosen');
        elseif K(1)*K(2) > 0
            region = 3;
        end
    elseif K(3) > 0
        if K(1)*K(2) > 0
            region = 6;
        elseif K(2) > 0 && K(1) < 0
            region = 1;
        elseif K(1) == 0 && K(2) > 0
            region = 6;
            warning('Spacecraft symmetric about I1, R6 chosen');
        elseif K(2) == 0 && K(1) > 0
            region = 6;
            warning('Spacecraft symmetric about I2, R6 chosen');
        elseif K(1) > 0
            if (1 - K(2)*K(2) + K(3))^2 + 16*K(1)*K(2) < 0
                region = 5;
            elseif (1 - K(2)*K(2) + K(3))^2 + 16*K(1)*K(2) > 0
                region = 7;
            else
                region = 5;
                warning('K values on boundary between R5 and R7 (R5 chosen)');
            end
        end
    else
        if K(1) == -K(2)
            if K(2) > 0
                region = 2;
                warning('K values on boundary bewteen R1 and R2 (R2 chosen)');
            elseif K(2) < 0
                region = 4;
                if (1 - K(2)*K(2) + K(3))^2 + 16*K(1)*K(2) < 0
                    warning('K values on boundary between R4 and R5 (R4 chosen)');
                elseif (1 - K(2)*K(2) + K(3))^2 + 16*K(1)*K(2) > 0
                    warning('K values on boundary between R4 and R7 (R4 chosen)');
                else
                    warning('K values on boundary between R4, R5, R7 (R4 chosen)');
                end
            elseif K(1) == 0 || K(2) == 0
                region = 0;
                warning('Spherical mass properties. region = 0 (meaningless) by default');
            end
        end     
    end

end