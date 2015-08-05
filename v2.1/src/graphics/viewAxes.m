function [a, b] = viewAxes(n)

  n = [n(1); n(2); n(3)];
  n = n/norm(n);
  [m, k] = max(n.*n);
  clear m

  % set axis indices
  if k > 3
    error('primary view axis out of bounds');
  end
  if k + 1 > 3
    i = 1;
  else
    i = k + 1;
  end
  if i + 1 > 3
    j = 1;
  else
    j = i + 1;
  end
  if j + 1 > 3 && k ~= 1
    error('Executing unreachable code');
  end

  % reference frame axis vectors
  e1 = zeros(3, 1);
  e2 = zeros(3, 1);

  e1(i) = 1;
  e2(j) = 1;

  % project onto plane normal to n
  p1 = e1 - (n'*e1)*n;
  p2 = e2 - (n'*e2)*n;

  p1 = p1/norm(p1); % !! not really making a difference...
  p2 = p2/norm(p2);

  % find vector that bisects p1 and p2 (normal to n)
  q = p1 + p2;
  q = q/norm(q);

  % define view axis vectors as simple rotations in either direction
  a = simpleRot(q, n, -pi/4);
  b = simpleRot(q, n, pi/4);
  % normalize vectors - !! shouldn't be necessary
  a = a/norm(a);
  b = b/norm(b);
  c = cross(a, b);

  if n(k) < 0
    [a, b] = swap(a, b)
  end
%{
  % Plot reference frame axes, n, and view axes
  figure

  plot3([0 1], [0 0], [0 0], 'k', ... % reference frame vectors
      [0 0], [0 1], [0 0], 'k', ...
      [0 0], [0 0], [0 1], 'k', ...
      [0 n(1)], [0, n(2)], [0, n(3)], 'm.-', ... % vector normal to view plane
      [0 a(1)], [0, a(2)], [0, a(3)], 'b.-', ... % view axis vectors
      [0 b(1)], [0, b(2)], [0, b(3)], 'g.-', ...
      [0 p1(1)], [0 p1(2)], [0 p1(3)], ... %projections
      [0 p2(1)], [0 p2(2)], [0 p2(3)], ...
      [0 q(1)], [0 q(2)], [0 q(3)], 'c.-')
      %}
end
