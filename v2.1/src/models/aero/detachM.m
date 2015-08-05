function [M1_det, beta] = detachM(k, theta, tol)

    % Answer: M1_det = 1.8400490211; for M1 = 2.4, thetamax = 29.797440664 deg
    % M1_det = 1.8400490211;

    % k = 1.4; % ratio of specific heats
    % theta = 20*pi/180; % deflection angle
    % tol = 1e-5; %error tolerance

    % Compression Wave
    err = 10;
    error1 = err;
    M1_det = 0;

    index = 1;
    iter = 0;

    state = zeros(1, 8);

    while error1 > tol
        iter = iter + 1;

        % update M1 range
        if state(index, 1) - err > 0
            M1 = linspace(state(index, 1) - err, state(index, 1) + err, 100)';
        else
            M1 = linspace(0, state(index, 1) + err, 100)'; % first iteration
        end

        % update state data
        state = obshk(k, M1, ones(100, 1)*theta, 1);
        [a, b] = size(state);
        index = 1;

        % find wave angle corresponding to M1_det estimate (always overestimate)
        while index <= a % look for first number in beta column
            if isnan(state(index, 3)) && index + 1 <= a
                index = index + 1; % index of first number in beta column
            else
                break
            end
        end

        if index + 1 > a
            disp(a)
            error('stop');
        end

        % Set error equal to M1_det + M1 for closest beta angle
        if index + 1 <= a
            err = abs(state(index, 1) - state(index + 1, 1)); % new error
            error1 = err;
        else
            warning('Index of M1_det is at end of test array');
            fprintf('error (M1_det) = %2.5f, n = %d, a = %d\n', err, index, a);
            error1 = 0;
        end


    end

    M1_det = state(index, 1); % lowest Mach number found for theta where beta is
                           % actually a number (i.e. input theta is thetamax)
    beta = state(index, 3);

end
