function [PX, PY, view_axis1, view_axis2, c] = poincareMap(n, b, x, y, z, tol)
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
% n     - vector orthogonal to view plane
% b     - Location of vantage point (nonzero vector), offset from origin
%         (same units as input data); can be scalar zero
% x     - x coordinates of input data
% y     - y coordinates of input data
% z     - z coordinates of input data
% tol   - maximum distance from view plane allowed in order to include data
%         in Poincaré map; can be zero; generally necessary for discrete
%         values
% 
% Outputs
% PX    - x coordinate of points included in Poincaré map
% PY    - y coordinate of points included in Poincaré map
% view_axis1 - vector parallel to plot x axis
% view_axis2 - vector parallel to plot y axis
% c     - colormap (default jet) showing progression from beginning to end
%         of data set; use in scatterplot (optional)
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Baseline 20150314
% 
% :TODO:
% Uncomment error line
% Complete header
% Write function
% Add error checking code

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
fname='poincareMap';
error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);
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

    % Normalize n
    if norm(n) == 0
        error('n must be a nonzero vector');
    else
        n = n/norm(n);
    end
    
    % Use n in column vector form
    n = [n(1); n(2); n(3)];
    
    % If b is a vector, transform to column vector
    if b ~= 0
        b = [b(1); b(2); b(3)];
    end
    
    % Select reference frame axes (caused problems during development)
    axis1 = zeros(3, 1);
    axis2 = zeros(3, 1);
    
    indices = [1 2 3 1 2];
    
    if length(find(max(n) == n)) == 3
        view1 = 1;
        view2 = 2;
    elseif length(find(max(n) == n)) == 2
        view1 = find(min(n) == n);
        view2 = indices(view1 + 1);
    elseif length(find(max(n) == n)) == 1
        exclude = find(max(n) == n);
        view1 = indices(exclude + 1);
        view2 = indices(exclude + 2);
    end
    
    axis1(view1) = 1;
    axis2(view2) = 1;
    
    % Choose in-plane intermediate basis axes (not necessarily orthogonal)
    int_axis1 = axis1 - n*(n'*axis1);
    int_axis2 = axis2 - n*(n'*axis2);
    
    % Angle between intermediate (basis) axes
    theta = acos(int_axis1'*int_axis2);

    
    % Angle between intermediate axes and view axes
    phi = (theta - pi/2)/2;
    
    % View axes (first place I looked for the main bug mentioned before)
    view_axis1 = simple2DCM(n, phi)'*int_axis1;
    view_axis2 = simple2DCM(n, -phi)'*int_axis2;
    
    % Plot reference frame axes, n, and view axes
    figure(1)
    plot3([0 1], [0 0], [0 0], 'k', ...
        [0 0], [0 1], [0 0], 'k', ...
        [0 0], [0 0], [0 1], 'k', ...
        [0 n(1)], [0, n(2)], [0, n(3)], 'p', ...
        [0 int_axis1(1)], [0, int_axis1(2)], [0, int_axis1(3)], 'b.-', ...
        [0 int_axis2(1)], [0, int_axis2(2)], [0, int_axis2(3)], 'g.-', ...
        [0 view_axis1(1)], [0, view_axis1(2)], [0, view_axis1(3)], 'r--', ...
        [0 view_axis2(1)], [0, view_axis2(2)], [0, view_axis2(3)], 'm--')
    axis(0.4*[-2 2 -2 2 -2 2])
        
    
    % Select points to plot
    dataset = length(x); % number of points to test
    
    j = 0; % number of points to plot
    P = zeros(dataset, 3);
    for ii = 1:dataset
        % test if point is sufficiently close to plane
        if abs(n'*[x(ii); y(ii); z(ii)] - b) <= tol
            % record point if sufficiently close to plane
            j = j + 1;
            P(j, :) = [x(ii), y(ii), z(ii)];
        end
    end
    
    if j == 0
        fprintf('There are no points within tolerance to generate map');
        return
    end
    
    P = P(1:j, :);
        
    % Convert from reference frame to view frame
    PX = zeros(j, 1);
    PY = zeros(j, 1);
    
    for ii = 1:j
        PX(ii) = P(ii, :)*view_axis1;
        PY(ii) = P(ii, :)*view_axis2;
    end
    
    if nargout == 5
        c = jet(j);
    end
    
%     Example plot
%     figure(2)
%     scatter(PX, PY, 20, c)

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
