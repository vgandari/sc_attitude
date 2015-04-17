function qdot = qrate(q, omega)
% This function calculates the instantaneous rate of change of a unit
% quaterion.
% The unit quaternion and the angular velocity vector inputs both are
% assumed to be defined in the same reference frame (e.g. inertial).
    [a, b] = size(q);
    [c, d] = size(omega);
    
    if a == c || b == d
        w = omega;

        if max(c, d) == 3
            w(4) = 0;
        end

        if (a == 1 && b == 4) || (a == 4 && b == 1)
            E = [q(4) -q(3) q(2) q(1);
                q(3) q(4) -q(1) q(2);
                -q(2) q(1) q(4) q(3);
                -q(1) -q(2) -q(3) q(4)];
            if a < b % row q, w
                qdot = (1/2*w*E');
            else % column q, w
                qdot = (1/2*E*w);
            end
        else
            error('q must be a 4-vector');
        end
    else
        error('q and omega must both be row or column vectors');
    end
end
