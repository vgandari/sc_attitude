function [tspan, IC, file_name, region, label_x_name] = sc_init(testcase)
% This function initializes the spacecraft for sc_attitude.
% Choose batch = 0 in sc_attitude for a single run (define ICs here) or
% define batch as an array of test cases (test cases and test case
% selection defined in sc_batch).
    if testcase == 0 % single run
        % Define duration of simulation
        tspan = [0, 1]; % number of orbits

        % Define Orbit Mean Motion (CIRCULAR ORBIT)
        Omega = 1; % [rev/s]; if 1 rev/s, "No. of orbits [--]" xlabel
        Omega = 2*pi*Omega; % convert to [rad/s]
        
        % Mass Properties
        % K required for tf_EOMC, tf_EOMq
        % X = 1 - J/I required for sc_symmetricEOMq, where J is axial
        % moment of inertia
        % I required for gyrostat_EOMC
        
        I = zeros(1, 3);
        I(1) = 200;
        I(2) = 1000;
        I(3) = 1100;
        
        % Calculate Stability Region (used in plot title)
        region = sc_regionI(I);
%         region = sc_regionK(K);

        % Initial Orientation
        C0 = [0.9924, -0.0868, 0.0872;
              0.0944, 0.9917, -0.0868;
             -0.0789, 0.0944, 0.9924]; % row operator (wdot = w*C)

        % q0 = [0, 0, 0, 1]; % Can input an initial unit quaternion
        % C0 = q2DCM(q0);

        % Initial Angular Velocity
        omega0 = [0.1, 0.1, 1.1]; % [--], [rev of omega]/[rev of Omega]
        omega0 = omega0*Omega; % [rad/s]

        % Rotor Properties
        % Axial moments of inertia (elements equal to zero sufficient to
        % "turn off" rotors)
        J = [0, 0, 50];

        % Rotor orientations (user adds rates of change in gyrostat_EOMC)
        b10 = [1, 0, 0];
        b20 = [0, 1, 0];
        b30 = [0, 0, 1];

        % Rotor spin rates (user adds rates of change in gyrostat_EOMC)
        s0 = [0, 0, -100*Omega];
        
        
        % IC DEPENDING ON EOM
        
        IC = [I, omega0, C0(1, :), C0(2, :), C0(3, :), Omega, ...
              J, b10, b20, b30, s0];
        % Use convenient x-axis units in time history plots
        if Omega == 2*pi
            label_x_name = 'No. of Orbits [--]';
        else
            label_x_name = 'Time [s]';
        end
    else % batch runs
        [tspan, IC, file_name, region, label_x_name] = sc_batch(testcase);
    end
end