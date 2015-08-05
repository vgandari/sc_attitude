function A = partTerm(theta1, theta2, n)
    if n == 0
        A = 1/pi*(theta2 - theta1);
    else
        A = (1/n*sin(n*theta2)) - (1/n*sin(n*theta1));
    end
end
