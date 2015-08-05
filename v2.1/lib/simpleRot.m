function b = simpleRot(a, lambda, theta)
  b = a*cos(theta) - cross(a, lambda)*sin(theta) + ...
      dot(a,lambda)*lambda*(1 - cos(theta));
end
