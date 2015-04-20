function [plotname, rotorspeed] = graph_titles(author, region, label_x_name, omega0, s0)
% Generates graph titles for my batch analysis
    ind_omega0_max = logical(max(omega0) == omega0);
    orbitaxis = {'radial', 'tangent', 'normal'};
    plotname = horzcat(author, ' - Region ', num2str(region), ...
        ' SC (about orbit ', orbitaxis{ind_omega0_max}, ')');
    if strcmp(label_x_name, 'No. of Orbits [--]')
        rotorspeed = horzcat('s_1 = ', num2str(s0(1)/(2*pi)), ', s_2 = ', ...
        num2str(s0(2)), ', s_3 = ', num2str(s0(3)/(2*pi)));
    else
        rotorspeed = horzcat('s_1 = ', num2str(s0(1)), ', s_2 = ', ...
        num2str(s0(2)), ', s_3 = ', num2str(s0(3)));
    end
end