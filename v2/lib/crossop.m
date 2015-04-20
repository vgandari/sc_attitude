function wtilde = crossop(w)
% This function generates the omega cross operator (otherwise known as the
% affinor of rotation) from a given angular velocity vector. It is useful
% for cross multiplying a vector by a matrix.
    wtilde = [0    -w(3)  w(2);
              w(3)  0    -w(1);
             -w(2)  w(1)  0];
end