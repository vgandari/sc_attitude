function qdot = qrate(q, omega)
% Calculates the instantaneous rate of change of a unit
% quaterion. The unit quaternion and the angular velocity vector inputs
% both are assumed to be defined in the same reference frame.
% 
% Inputs
% omega   - 3-vector, float, angular velocity [rad/s]
% q       - 4-vector, float, quaternion [--]
% 
% Outputs
% qdot    - 4-vector, float, time rate of change of quaternion [1/s]
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150430
% 

% :TODO: the next task
% :BUG: thing to fix
% :KLUDGE: why code is ugly
% :TRICKY: sleep on it before editing again
% :WARNING: be careful to/not to write code this way
% :COMPILER: compiler problems
% :ATTRIBUTE: value

% -------------------------------------------------------------------------
% !!! EDIT THESE LINES BEFORE EACH EDIT/SAVE/RUN !!!
% -------------------------------------------------------------------------
fname='qrate';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
    warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------

% GET SIZE OF VECOTRS SO IT DOESN'T MATTER IF THEY'RE ROW OR COLUMN VECTORS
[a, b] = size(q);
[c, d] = size(omega);

% TEST: omega AND q ARE BOTH ROW OR COLUMN VECTORS
if a == c || b == d
    % CREATE DUMMY 4-VECTOR w FROM omega
    w = omega;
    if max(c, d) == 3
        w(4) = 0;
    end
    
    % TEST: q IS A 4 VECTOR
    if (a == 1 && b == 4) || (a == 4 && b == 1)
        % 
        E = [q(4) -q(3) q(2) q(1);
            q(3) q(4) -q(1) q(2);
            -q(2) q(1) q(4) q(3);
            -q(1) -q(2) -q(3) q(4)];
        % TEST: q IS A ROW/COLUMN VECTOR
        if a < b           %    row q, w
            qdot = (1/2*w*E');
        else               % column q, w
            qdot = (1/2*E*w);
        end
    else
        % q IS WRONG SIZE
        error('q must be a 4-vector');
    end
else
    error('q and omega must both be row or column vectors');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
