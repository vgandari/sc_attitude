function [IC] = sc_init(testcase)
% This function decides whether sc_attitude will run a single simulation or
% a series (batch) of experiments. If testcase is passed as 0 (batch = 0 in
% sc_attitude), sc_init will not run and the test cases defined here may be
% ignored. If batch is an array with all positive elements, sc_batch will
% define the initial conditions for the spacecraft many times over. The
% original function is written so that the user provides sets of values for
% each variable and depending on the test case, a combination of values
% will be assigned to the output variables. It is importatn to note that
% variables can be added to sc_batch and its outputs to suit the user's
% particular needs.
%
% Input
% testcase - which test case to run (loop variable in sc_attitude)
%
% Outputs
% tspan - duration of simulation
% IC - initial conditions of spacecraft
% file_name - file name generated based on IC
% label_x_name -

    % Define Orbit Mean Motion
    Omega = 1; % [rev/s]; if 1 orbit/s, can label x axis as no. of orbits
    Omega = 2*pi*Omega; % convert to [rad/s]

    % Rotor orientations
    b10 = [1, 0, 0];
    b20 = [0, 1, 0];
    b30 = [0, 0, 1];

    % Initial Orientation (q must be row vector, C must be row operator
    C0 = eye(3, 3);
%     C0 = [0.9924, -0.0868, 0.0872;
%           0.0944, 0.9917, -0.0868;
%          -0.0789, 0.0944, 0.9924]; % row operator (Kane example)

    % Test cases (48 combinations):

    s00 = [0, 0, 0];
    s0x = [1, 0, 0];
    s0y = [0, 1, 0];
    s0z = [0, 0, 1];
    s0xy = [1, 1, 0];
    s0yz = [0, 1, 1];
    s0zx = [1, 0, 1];
    s0xyz = [1, 1, 1];

%     [1; 0.2; 0.3];
%     [-0.3; -1; 0.2];
%     [-1; 0.2; 0.3];
%     [-0.3; -1; 0.2];
%     [-0.3; -0.2; 1];
%     [-1; 0.2; 0.3];
%     [-0.3; -1; 0.2];
%     [-0.3; -0.2; 1];
%     [-1; 0.2; 0.3];
%     [-0.3; -1; 0.2];

    % w3 > w1 > w2
    omega0x1 = [1.01, 0.02, 0.03]; % TF stable
    omega0y1 = [0.03, 1.01, 0.02]; % TF unstable
    omega0z1 = [0.03, 0.02, 1.01]; % TF most stable, close to nominal
    % w2 > w1 > w3
    omega0z7 = [0.02, 0.03, 1.01]; % TF unstable, close to nominal
    omega0x7 = [1.01, 0.03, 0.02]; % TF stable
    omega0y7 = [0.03, 1.01, 0.02]; % TF stable


    % Include nutation plot:
    % Use horzcat(var, '\_nutation')

    % Array used to choose test case
    n = 1:96;
    % testcase is the loop variable. It is input from sc_batch.

    % IC selection according to test case
%     % Duration of simulation
%     switch testcase
%         case (+logical(testcase == section_array(1, 2, n))) ...
%                 *section_array(1, 2, n)'
%             tspan = tspan1;
%             n = section_array(1, 2, n);
%         case (+logical(testcase == section_array(2, 2, n))) ...
%                 *section_array(2, 2, n)'
%             tspan = tspan2;
%             n = section_array(2, 2, n);
%     end

    % Mass Properties
    switch testcase
        case (+logical(testcase == section_array(1, 2, n))) ...
                *section_array(1, 2, n)'
            region = 1;
            I = [30, 40, 50];
            jj = 10;
            n = section_array(1, 2, n);
        case (+logical(testcase == section_array(2, 2, n))) ...
                *section_array(2, 2, n)'
            region = 7;
            I = [90, 100, 80];
            jj = 20;
            n = section_array(2, 2, n);
    end

    % Rotor spin rates
    switch testcase
        case (+logical(testcase == section_array(1, 8, n))) ...
                *section_array(1, 8, n)'
            s0 = s00;
            n = section_array(1, 8, n);
        case (+logical(testcase == section_array(2, 8, n))) ...
                *section_array(2, 8, n)'
            s0 = s0x;
            n = section_array(2, 8, n);
        case (+logical(testcase == section_array(3, 8, n))) ...
                *section_array(3, 8, n)'
            s0 = s0y;
            n = section_array(3, 8, n);
        case (+logical(testcase == section_array(4, 8, n))) ...
                *section_array(4, 8, n)'
            s0 = s0z;
            n = section_array(4, 8, n);
        case (+logical(testcase == section_array(5, 8, n))) ...
                *section_array(5, 8, n)'
            s0 = s0xy;
            n = section_array(5, 8, n);
        case (+logical(testcase == section_array(6, 8, n))) ...
                *section_array(6, 8, n)'
            s0 = s0yz;
            n = section_array(6, 8, n);
        case (+logical(testcase == section_array(7, 8, n))) ...
                *section_array(7, 8, n)'
            s0 = s0zx;
            n = section_array(7, 8, n);
        case (+logical(testcase == section_array(8, 8, n))) ...
                *section_array(8, 8, n)'
            s0 = s0xyz;
            n = section_array(8, 8, n);
    end

    J = jj*s0;
    s0 = Omega*s0;


    % Angular Velocity
    omega0 = [0 0 0];
    switch testcase
        case (+logical(testcase == section_array(1, 3, n))) ...
                *section_array(1, 3, n)'
            if region == 1
                omega0 = omega0x1;
            else
                omega0 = omega0x7;
            end
            n = section_array(1, 3, n);
        case (+logical(testcase == section_array(2, 3, n))) ...
                *section_array(2, 3, n)'
            if region == 1
                omega0 = omega0y1;
            else
                omega0 = omega0y7;
            end
            n = section_array(2, 3, n);
        case (+logical(testcase == section_array(3, 3, n))) ...
                *section_array(3, 3, n)'
            if region == 1
                omega0 = omega0z1;
            elseif region == 7
                omega0 = omega0z7;
            end
            n = section_array(3, 3, n);
    end

    omega0 = Omega*omega0;
    file_name = '';
    if isequal(s0, s00)
        file_name = horzcat(file_name, '_no_gyro');
    elseif isequal(s0, Omega*s0x)
        file_name = horzcat(file_name, '_gyro_1');
    elseif isequal(s0, Omega*s0y)
        file_name = horzcat(file_name, '_gyro_2');
    elseif isequal(s0, Omega*s0z)
        file_name = horzcat(file_name, '_gyro_3');
    elseif isequal(s0, Omega*s0xy)
        file_name = horzcat(file_name, '_gyro_1_2');
    elseif isequal(s0, Omega*s0yz)
        file_name = horzcat(file_name, '_gyro_2_3');
    elseif isequal(s0, Omega*s0zx)
        file_name = horzcat(file_name, '_gyro_1_3');
    elseif isequal(s0, Omega*s0xyz)
        file_name = horzcat(file_name, '_all_gyros');
    end

    IC = [DCM2q(C0), omega0, I, inertiaRatios(I), Omega];
    %, J, b10, b20, b30, s0];

    ind_omega0_max = logical(max(omega0) == omega0);
    orbitaxis = {'rad', 'tan', 'norm'};
    %file_name = horzcat(file_name, '_', cell2mat(orbitaxis(ind_omega0_max)));

end
