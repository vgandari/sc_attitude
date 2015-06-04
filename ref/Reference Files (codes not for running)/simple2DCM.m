% Converts from lambda vector and angle of rotation to DCM
% input theta in radians

function C = simple2DCM(lambda, theta)
    C(1, 1) = cos(theta) + lambda(1)^2*(1 - cos(theta));
    C(1, 2) = -lambda(3)*sin(theta) + lambda(1)*lambda(2)*(1 - cos(theta));
    C(1, 3) = lambda(2)*sin(theta) + lambda(3)*lambda(1)*(1 - cos(theta));    
    C(2, 1) = lambda(3)*sin(theta) + lambda(1)*lambda(2)*(1 - cos(theta));
    C(2, 2) = cos(theta) + lambda(2)^2*(1 - cos(theta));
    C(2, 3) = -lambda(1)*sin(theta) + lambda(2)*lambda(3)*(1 - cos(theta));
    C(3, 1) = -lambda(2)*sin(theta) + lambda(3)*lambda(1)*(1 - cos(theta));
    C(3, 2) = lambda(1)*sin(theta) + lambda(2)*lambda(3)*(1 - cos(theta));
    C(3, 3) = cos(theta) + lambda(3)^2*(1 - cos(theta));
% end

%     C(1, 1) = [cos(theta) + lambda(1)^2*(1 - cos(theta)), -lambda(3)*sin(theta) + lambda(1)*lambda(2)*(1 - cos(theta)), lambda(2)*sin(theta) + lambda(3)*lambda(1)*(1 - cos(theta));
%         lambda(3)*sin(theta) + lambda(1)*lambda(2)*(1 - cos(theta)), cos(theta) + lambda(2)^2*(1 - cos(theta)), -lambda(1)*sin(theta) + lambda(2)*lambda(3)*(1 - cos(theta));
%         -lambda(2)*sin(theta) + lambda(3)*lambda(1)*(1 - cos(theta)), lambda(1)*sin(theta) + lambda(2)*lambda(3)*(1 - cos(theta)), cos(theta) + lambda(3)^2*(1 - cos(theta))];
end