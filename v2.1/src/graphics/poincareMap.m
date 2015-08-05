function poincareMap(x, y, z, n, tol, offset)
% This function generates data for use in generating a Poincaré map from a
% set of discrete data points in three dimensions. The output is a reduced
% data set in two dimensions suitable for plotting a Poincaré map whose
% axes form an orthogonal basis of the view plane. The view plane is a two
% dimensional subspace of the three dimensional space in which the original
% data is represented. Plot axes for the Poincaré map are automatically
% generated. The user can edit lines 99-108 to optionally include/exclude a
% visualization of the generated plot axes.
%
% Inputs
% n      - vector orthogonal to view plane
% offset - Location of vantage point (nonzero vector), offset from origin
%          (same units as input data); can be scalar zero
% x      - x coordinates of input data
% y      - y coordinates of input data
% z      - z coordinates of input data
% tol    - maximum distance from view plane allowed in order to include data
%          in Poincaré map; can be zero; generally necessary for discrete
%          values
%
% Victor Gandarillas
% gandarillasv@gmail.com


% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
    warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------

% Normalize n
if norm(n) == 0
    error('n must be a nonzero vector');
end

% Use n in column vector form
n = [n(1); n(2); n(3)];
n = n/norm(n);

if nargin < 6
  offset = 0;
end

% If b is a vector, transform to column vector
if offset ~= 0 && length(offset) == 3
  offset = [offset(1); offset(2); offset(3)];
end

% reduce data set
r = zeros(1, length(x));
s = zeros(1, length(x));
t = zeros(1, length(x));

for i = 1:length(x)
  if abs(n'*([x(i); y(i); z(i)] - offset)) < tol
    r(i) = x(i);
    s(i) = y(i);
    t(i) = z(i);
  end
end

k = 3;
% Set view axes (k=3 by default)
[a, b] = viewAxes(n, k);

plot(a'*([r; s; t] - offset), b'*([r; s; t] - offset), 'o')
xlabel(horzcat('[', num2str(a(1)), '; ', num2str(a(2)), '; ', num2str(a(3)), ']'))
ylabel(horzcat('[', num2str(b(1)), '; ', num2str(b(2)), '; ', num2str(b(3)), ']'))


end
