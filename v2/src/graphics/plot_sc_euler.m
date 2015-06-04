function h = plot_sc_euler(time, angle, angle_name, plotname, subtitle, ...
    label_x_name)
% Plot angle time history for sc_attitude
% Inputs
% time - column vector of time from ode45
% angle - column vector of angle calculated in/from ode45
% angle_name - string input for ylabel
% plotname - string containing title appearing at the top of plot (suptitle)
% subtitle - string to display rotor speeds (title)
% label_x_name - xlabel
    
    % New figure
    h = figure;
    set(gcf,'Visible','off');
    hold on
    plot(time, 180/pi*unwrap(angle)) % [deg]
    suptitle(horzcat(plotname, ' ', angle_name))
    title(subtitle)
    xlabel(label_x_name)
    ylabel(horzcat(angle_name, ' Angle [deg]'))
    
    % Display angle upper limit in plot
    sup = max(180/pi*unwrap(angle));
    if sup < 180
        axis([min(time) max(time) 0 180])
        plot([0 max(time)], [sup sup], 'g-')
    else
        axis([min(time) max(time) 0 1.05*sup])
    end
end