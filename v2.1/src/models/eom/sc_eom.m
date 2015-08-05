function udot = sc_eom(t, u)
    w = [u(1); u(2); u(3)];
    q = [u(1); u(2); u(3); u(4)];
    C = q2DCM(q);
    K = [u(5); u(6); u(7)];

    % Dynamics
    M = f2_C(K, C, w) % update function to use matrices

    % Kinematics
    wdot = K.*[w(2)*w(3) - 3*Omega^2* ( C(1, 3)*C(3, 2) - C(1, 2)*C(3, 3) );
               w(3)*w(1) - 3*Omega^2* ( C(1, 1)*C(3, 3) - C(1, 3)*C(3, 1) );
               w(1)*w(2) - 3*Omega^2* ( C(1, 2)*C(3, 1) - C(1, 1)*C(3, 2) )];
    wdot = wdot + M;

    qdot = qrate(q, w);

    udot(1) = wdot(1);
    udot(2) = wdot(2);
    udot(3) = wdot(3);
    udot(4) = qdot(1);
    udot(5) = qdot(2);
    udot(6) = qdot(3);
    udot(7) = qdot(4);
    if constantsBegin <= length(u)
      udot(constantsBegin:length(u)) = zeros(1, length(u) - constantsBegin + 1);
    end
end
