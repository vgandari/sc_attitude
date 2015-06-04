% Equilibrium orientations expressed as quaternions
clear
clc

% KEEP IN MIND THAT ALL QUATERNIONS WITH OPPOSITE SIGN REPRESENT THE SAME
% ORIENTATION (THIS APPLIES TO ALL QUATERNIONS)

C1 = [1 0 0; 0 1 0; 0 0 1]
q1 = DCM2q(C1')
C2 = [-1 0 0; 0 0 1; 0 1 0]
q2 = DCM2q(C2')
q2 = [1/sqrt(2); 1/sqrt(2); 0; 0]
C3 = [0 1 0; -1 0 0; 0 0 1]
q3 = DCM2q(C3')
C4 = [0 0 1; 0 1 0; -1 0 0]
q4 = DCM2q(C4')
C5 = [0 0 1; 1 0 0; 0 1 0]
q5 = DCM2q(C5')
C6 = [0 0 -1; 0 1 0; 1 0 0]
q6 = DCM2q(C6')
C7 = [1 0 0; 0 0 -1; 0 1 0]
q7 = DCM2q(C7')
C8 = [0 1 0; 1 0 0; 0 0 -1]
q8 = DCM2q(C8')
q8 = [1/sqrt(2); 1/sqrt(2); 0; 0]
C9 = [0 1 0; 0 0 1; 1 0 0]
q9 = DCM2q(C9')
C10 = [0 -1 0; 1 0 0; 0 0 1]
q10 = DCM2q(C10')
C11 = [0 0 1; 0 -1 0; 1 0 0]
q11 = DCM2q(C11')
q11 = [1/sqrt(2); 1/sqrt(2); 0; 0]
C12 = [1 0 0; 0 0 1; 0 -1 0]
q12 = DCM2q(C12')
C13 = [-1 0 0; 0 -1 0; 0 0 1]
q13 = DCM2q(C13')
q13 = [0; -1; 0; 0]
C14 = [0 0 -1; -1 0 0; 0 1 0]
q14 = DCM2q(C14')
C15 = [0 -1 0; 0 0 -1; 1 0 0]
q15 = DCM2q(C15')
C16 = [0 -1 0; 0 0 1; -1 0 0]
q16 = DCM2q(C16')
C17 = [0 0 -1; 1 0 0; 0 -1 0]
q17 = DCM2q(C17')
C18 = [-1 0 0; 0 1 0; 0 0 -1]
q18 = DCM2q(C18')
q18 = [0; -1; 0; 0]
C19 = [0 0 1; -1 0 0; 0 -1 0]
q19 = DCM2q(C19')
C20 = [1 0 0; 0 -1 0; 0 0 -1]
q20 = DCM2q(C20')
q20 = [-1; 0; 0; 0]
C21 = [0 1 0; 0 0 -1; -1 0 0]
q21 = DCM2q(C21')
C22 = [0 0 -1; 0 -1 0; -1 0 0]
q22 = DCM2q(C22')
q22 = [-1/sqrt(2); 1/sqrt(2); 0; 0]
C23 = [0 -1 0; -1 0 0; 0 0 -1]
q23 = DCM2q(C23')
q23 = [1/sqrt(2); 1/sqrt(2); 0; 0]
C24 = [-1 0 0; 0 0 -1; 0 -1 0]
q24 = DCM2q(C24')
q24 = [1/sqrt(2); 1/sqrt(2); 0; 0]

for n = 1:24
    fprintf('Equilibrium point %d:\n-------------------------\n', n);
    % Equilibrium point about which to linearize the system
    C = eval(['C', num2str(n)]);
    disp(C)
    
    q = eval(['q', num2str(n)]);
    disp(q')
    
    w = C(3, :)';
    disp(w')
    
    syms wt1 wt2 wt3 K1 K2 K3 I1 I2 I3 Ct11 Ct12 Ct12 Ct13 Ct21 Ct22 Ct23 Ct31 Ct32 Ct33
    I = [I1 0 0; 0 I2 0; 0 0 I3]; % PMOIs    
    Ct = [Ct11 Ct12 Ct13; Ct21 Ct22 Ct23; Ct31 Ct32 Ct33]; % DCM perturbations
    wt = [wt1; wt2; wt3];
    wcross = [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0]; % w cross operator
    wtcross = [0 -wt3 wt2; wt3 0 -wt1; -wt2 wt1 0]; % w perturbation cross operator
    Ccross = [0 -C(3, 1) C(2, 1); C(3, 1) 0 -C(1, 1); -C(2, 1) C(1, 1) 0];
    Ctcross = [0 -Ct(3, 1) Ct(2, 1); Ct(3, 1) 0 -Ct(1, 1); -Ct(2, 1) Ct(1, 1) 0];
    wdot = -2*pi*((wcross + wtcross)*I*(w + wt) - 3*(Ccross + Ctcross)*I*(C(:, 1) + Ct(:, 1)));
    wdot = expand(wdot);
    disp(wdot)
    
    syms qt1 qt2 qt3 qt4
    qt = [qt1; qt2; qt3; qt4];
    
    E = [q(4) -q(3) q(2) q(1);
        q(3) q(4) -q(1) q(2);
        -q(2) q(1) q(4) q(3);
        -q(1) -q(2) -q(3) q(4)];
    
    Et = [qt(4) -qt(3) qt(2) qt(1);
        qt(3) qt(4) -qt(1) qt(2);
        -qt(2) qt(1) qt(4) qt(3);
        -qt(1) -qt(2) -qt(3) qt(4)];
    
    qdot = 1/2*(E + Et)*[(w + wt); 0];
    qdot = expand(qdot);
    
    disp(qdot)
    
    Ct(1, 1) = 1 - 2*(q(2) + qt2)^2 - 2*(q(3) + qt3)^2 - C(1, 1);
    Ct(2, 1) = 2*((q(1) + qt1)*(q(2) + qt2) - (q(3) + qt3)*(q(4) + qt4)) - C(2, 1);
    Ct(3, 1) = 2*((q(3) + qt3)*(q(1) + qt1) + (q(2) + qt2)*(q(4) + qt)) -C(3, 1);
    
    disp(expand(Ct(:, 1)))
    fprintf('\n');
    disp(expand(Ct(:, 1)))
    
    fprintf('\n');
end
% syms C11 C12 C13 C21 C22 C23 C31 C32 C33 Ct11 Ct12 Ct13 Ct21 Ct22 Ct23 Ct31 Ct32 Ct33
% 
% C = [C11 C12 C13; C21 C22 C23; C31 C32 C33];
% 
% Ct = [Ct11 Ct12 Ct13; Ct21 Ct22 Ct23; Ct31 Ct32 Ct33];
% 
% syms qt1 qt2 qt3 qt4 q1 q2 q3 q4
% 
% q = [q1; q2; q3; q4];
% 
% qt = [qt1; qt2; qt3; qt4];
% 
% Ct(1, 1) = 1 - 2*(q(2) + qt2)^2 - 2*(q(3) + qt3)^2 - C(1, 1);
% Ct(2, 1) = 2*((q(1) + qt1)*(q(2) + qt2) - (q(3) + qt3)*(q(4) + qt4)) - C(2, 1);
% Ct(3, 1) = 2*((q(3) + qt3)*(q(1) + qt1) + (q(2) + qt2)*(q(4) + qt)) -C(3, 1);
% 
% C(:, 1)
% Ct(:, 1)

% k = [(I3 - I2)/K1; (I1 - I3)/K2; (I2 - I1)/K3]
% wdot = wdot./k