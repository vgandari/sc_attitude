% VERIFY_EOM
% SCRIPT USED TO VERIFY EOM

close all
clear all
clc

% Define duration of simulation
tspan = [0, 1]; % number of orbits

% Choose test case
testcase = 5;

% Set of EOM to input to solver
eom = {'tf_EOMC', 'tf_EOMq', 'sc_symmetricEOMq', 'sc_EOMC', ...%'sc_EOMq', ...
    'gyrostat_EOMC', ...%'gyrostat_EOMq'
    };


% Define Orbit Mean Motion
Omega = 1; % rev/s, i.e. 1 orbit/s, can label plot as no. of orbits?
Omega = 2*pi*Omega; % rad/s

% Define ICs
if  testcase == 3
    nutation0 = 0.1;
    
    q0 = [0, sin(nutation0/2), 0, cos(nutation0/2)];
    
    C0 = q2DCM(q0);
    
%     I = ;
%     J = ;
%     X = 1 - J/I;
    % test cases
    X = -0.4;
%     X = 0.2;
%     X = 0.8;
    X = -X;
    Y = 1;
    omega0 = [0, 0, Omega*(Y + 1)];
else
    I = zeros(1, 3);
    I(1) = 200;
    I(2) = 1000;
    I(3) = 1100;
    
    K = zeros(1, 3);
    K(1) = -0.5;
    K(2) = 0.9;
    K(3) = (-(0.9-0.5)/(1-.5*.9));
    
    C0 = [0.9924, -0.0868, 0.0872;
          0.0944, 0.9917, -0.0868;
         -0.0789, 0.0944, 0.9924]; % row operator

    q0 = DCM2q(C0);
    
    omega0 = [0.1, 0.1, 1.1]*Omega;
    
    J = [0, 0, 50];
    
    b10 = [1, 0, 0];
    b20 = [0, 1, 0];
    b30 = [0, 0, 1];
    
    s0 = [0, 0, -100*Omega];
end

% Set ICs for solver
switch testcase
    case 1
      IC = [K, omega0, C0(1, :), C0(2, :), C0(3, :)];
    case 2
      IC = [K, omega0, q0];
    case 3
      IC = [X, omega0, q0, Omega];
    case 4
      IC = [K, omega0, C0(1, :), C0(2, :), C0(3, :), Omega];
    case 5
%       IC = [K, omega0, q0, Omega];
%     case 6
      IC = [I, omega0, C0(1, :), C0(2, :), C0(3, :), Omega, ...
            J, b10, b20, b30, s0];
end

% Set options for solver
options = odeset('AbsTol', 1e-12, 'RelTol', 1e-12);

% Run solver
[t, xdot] = ode45(cell2mat(eom(testcase)), tspan, IC, options);

% Calculate and plot nutaton
[stop, dataset] = size(xdot);
nutation = zeros(1, stop);

for n = 1:stop
    if testcase == 2 || testcase == 3
        C = q2DCM(xdot(n, 7:10));
        nutation(n) = acos(C(3, 3));
    else
%         C = [xdot(n, 7:9); xdot(n, 10:12); xdot(n, 13:15)]; % add
%         DCM2euler later
        nutation(n) = acos(xdot(n, 15));
    end
end

figure(1)
plot(t, unwrap(nutation)*180/pi)
axis([min(tspan) max(tspan) 0 180])

figure(2)
plot(xdot(:, 4), xdot(:, 5))
