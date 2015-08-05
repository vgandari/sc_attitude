function [lambda, theta] = q2simple(q)
% This function converts a unit quaternion to a simple axis-angle
% representation.
% The unit quaternion vector has the same dmension as the rotation axis +
% the fourth Euler parameter appended, i.e. q is a 4-vector.
    theta = 2*acos(q(4));
    lambda = q(1:3)/sin(theta/2);
end