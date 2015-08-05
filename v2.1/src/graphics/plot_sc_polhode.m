function plot_sc_polhode(time, data, lambda, theta, resolution, plotOut, plotname)%, rotorspeed)
% Plot polhode curve with inertia ellipsoid
% Inputs
% time - column vector of time from ode45
% I - mass properties
% omega - column vector of omega from ode45
% res - resolution of inertia ellipsoid
% plotname - string containing title appearing at the top of plot (suptitle)
% subtitle - string to display rotor speeds (title)

    % Define Inertia Ellipsoid
    omega = data(:, 5:7);
    I = data(1, 8:10);
    a = 1./sqrt(I);

    [x,y,z] = ellipsoid(0, 0, 0, a(1), a(2), a(3), resolution);


    % View Settings
    h = figure
    if plotOut
      set(gcf,'Visible','on');
    else
      set(gcf,'Visible','off');
    end
    hold on
    axis equal
    camlight left; lighting phong
    alpha(0.2)
    view(3)



    % Plot Inertia Ellipsoid
    surfacePlot = surf(x, y, z,'FaceColor','blue','EdgeColor','none');
    rotate(surfacePlot, lambda, theta);
    % Find maximum angular velocity magnitude (used later for scaling)
    m = zeros(1, length(time));
    for n = 1:length(time)
        m(n) = norm(omega(n, :));
    end
    max_omega = max(m);

    % Mark initial angular velocity on plot scaled by max(omega)
    w0 = plot3(a(1)*omega(1, 1)/max_omega, ...
        a(2)*omega(1, 2)/max_omega, ...
        a(3)*omega(1, 3)/max_omega, 'ro');
    rotate(w0, lambda, theta);

    % Plot Polhode cuve scaled by max(omega)
    wCurve = plot3(a(1)*omega(:, 1)/max_omega, ...
        a(2)*omega(:, 2)/max_omega, ...
        a(3)*omega(:, 3)/max_omega);
    rotate(wCurve, lambda, theta);




    % Graph Titles and Labels
    suptitle(plotname)
    %title(rotorspeed)
    xlabel(['PMOI = ' num2str(I(1)) 'b_' num2str(1)])
    ylabel(['PMOI = ' num2str(I(2)) 'b_' num2str(2)])
    zlabel(['PMOI = ' num2str(I(3)) 'b_' num2str(3)])
end
