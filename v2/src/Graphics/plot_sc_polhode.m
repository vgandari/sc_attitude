function h = plot_sc_polhode(time, I, omega, res, plotname, rotorspeed)
% Plot polhode curve with inertia ellipsoid
% Inputs
% time - column vector of time from ode45
% I - mass properties
% omega - column vector of omega from ode45
% res - resolution of inertia ellipsoid
% plotname - string containing title appearing at the top of plot (suptitle)
% subtitle - string to display rotor speeds (title)
    
    % Define Inertia Ellipsoid
    a = 1./sqrt(I);
    
    [x,y,z] = ellipsoid(0, 0, 0, a(1), a(2), a(3), res);
    
    h = figure;
    set(gcf,'Visible','off');
    hold on
    
    % Plot Inertia Ellipsoid
    surf(x, y, z,'FaceColor','blue','EdgeColor','none');
    axis equal
    camlight left; lighting phong
    alpha(0.2)
    view(3)
    
    % Find maximum angular velocity magnitude (used later for scaling)
    m = zeros(1, length(time));
    for n = 1:length(time)
        m(n) = norm(omega(n, :));
    end
    max_omega = max(m);
    
    % Mark initial angular velocity on plot scaled by max(omega)
    plot3(a(1)*omega(1, 1)/max_omega, ...
        a(2)*omega(1, 2)/max_omega, ...
        a(3)*omega(1, 3)/max_omega, 'ro')
    
    % Plot Polhode cuve scaled by max(omega)
    plot3(a(1)*omega(:, 1)/max_omega, ...
        a(2)*omega(:, 2)/max_omega, ...
        a(3)*omega(:, 3)/max_omega)
    
    % Graph Titles and Labels
    suptitle(plotname)
    title(rotorspeed)
    xlabel(['b_' num2str(1)])
    ylabel(['b_' num2str(2)])
    zlabel(['b_' num2str(3)])
end
