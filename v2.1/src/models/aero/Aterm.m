function A = Aterm(beta, theta1, theta2, m, n)
    if n == 0
        A = beta - 1/pi*(m*theta2 - m*theta1);
    else
        A = m*(1/n*sin(n*theta2)) - m*(1/n*sin(n*theta1));
    end
end
