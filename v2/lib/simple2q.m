function q = simple2q(lambda, theta)
% This function converts a rotation represented simply by an axis and an
% angle to a direction cosine matrixunit quaternion.
% The unit quaternion vector has the same dmension as the rotation axis +
% the fourth Euler parameter appended, i.e. q is a 4-vector.
    [a, b] = size(lambda);
    if (a == 1 && b ==3) || (a == 3 && b == 1)
        if a > b
            q = [lambda*sin(theta/2); cos(theta/2)];
        else
            q = [lambda*sin(theta/2), cos(theta/2)];
        end
    else
        error('lambda must be a 3-vector');
    end
end