clear all
clc


syms wt1 wt2 wt3 K1 K2 K3 I1 I2 I3 Ct11 Ct12 Ct12 Ct13 Ct21 Ct22 Ct23 Ct31 Ct32 Ct33 qt1 qt2 qt3 qt4 qd1 qd2 qd3 qd4 wd1 wd2 wd3

% B matrix for idealized effectors:

B = [zeros(4, 3); eye(3, 3)];
K = {};

% n = 4;
for n = 1:24
if n ==1
% Equilibrium point 1:

wdot = [                               2*pi*I2*wt2 - 2*pi*I3*wt2;
 6*pi*(2*qt2)*I1 - 6*pi*(2*qt2)*I3 - 2*pi*I1*wt1 + 2*pi*I3*wt1;
                             6*pi*(-2*qt3)*I2 - 6*pi*(-2*qt3)*I1];
 
qdot = [       qt2/2 + wt1/2;
       wt2/2 - qt1/2;
 qt4/2 + wt3/2 + 1/2;
             - qt3/2];
 
elseif n == 2
% Equilibrium point 2:

wdot = [                               2*pi*I2*wt3 - 2*pi*I3*wt3;
                             6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I3 - 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I1;
 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt2 + 1)*I1 - 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt2 + 1)*I2 + 2*pi*I1*wt1 - 2*pi*I2*wt1];
 
qdot = [                                  (2^(1/2)*wt3)/4 - qt3/2;
                                 qt4/2 - (2^(1/2)*wt3)/4;
   qt1/2 - (2^(1/2)*wt1)/4 + (2^(1/2)*wt2)/4 + 2^(1/2)/4;
 - qt2/2 - (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4 - 2^(1/2)/4];
 
elseif n == 3
% Equilibrium point 3:

wdot = [ 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt2)*I2 - 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt2)*I3 + 2*pi*I2*wt2 - 2*pi*I3*wt2;
                               2*pi*I3*wt1 - 2*pi*I1*wt1;
                             6*pi*(-2*2^(1/2)*qt3)*I1 - 6*pi*(-2*2^(1/2)*qt3)*I2];
 
qdot = [  qt2/2 + (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4;
 (2^(1/2)*wt1)/4 - qt1/2 + (2^(1/2)*wt2)/4;
       qt4/2 + (2^(1/2)*wt3)/4 + 2^(1/2)/4;
     - qt3/2 - (2^(1/2)*wt3)/4 - 2^(1/2)/4];
 
elseif n == 4
% Equilibrium point 4:

wdot = [                             6*pi*(-2^(1/2)*qt3 - 2^(1/2)*qt1)*I2 - 6*pi*(-2^(1/2)*qt3 - 2^(1/2)*qt1)*I3;
 6*pi*(2*2^(1/2)*qt2)*I3 - 6*pi*(2*2^(1/2)*qt2)*I1 + 2*pi*I1*wt3 - 2*pi*I3*wt3;
                               2*pi*I2*wt2 - 2*pi*I1*wt2];
 
qdot = [  (2^(1/2)*wt1)/4 - qt4/2 - (2^(1/2)*wt3)/4 - 2^(1/2)/4;
                               (2^(1/2)*wt2)/4 - qt3/2;
 qt2/2 + (2^(1/2)*wt1)/4 + (2^(1/2)*wt3)/4 - 2^(1/2)/4;
                               qt1/2 + (2^(1/2)*wt2)/4];
 
elseif n == 5
% Equilibrium point 5:

wdot = [ 6*pi*(qt2 - 2*qt1 - qt3)*I3 - 6*pi*(qt2 - 2*qt1 - qt3)*I2 + 2*pi*I2*wt3 - 2*pi*I3*wt3;
                                                       0;
 6*pi*(2*qt2 + 2*qt3)*I2 - 6*pi*(2*qt2 + 2*qt3)*I1 + 2*pi*I1*wt1 - 2*pi*I2*wt1];
 
 qdot = [ wt1/4 - qt3/2 + wt2/4 - wt3/4 + 1/4;
 qt4/2 - wt1/4 + wt2/4 + wt3/4 + 1/4;
 qt1/2 + wt1/4 - wt2/4 + wt3/4 - 1/4;
 wt1/4 - qt2/2 + wt2/4 + wt3/4 + 1/4];
 
elseif n == 6
% Equilibrium point 6:

wdot = [                             6*pi*(2^(1/2)*qt1 - 2^(1/2)*qt3)*I3 - 6*pi*(2^(1/2)*qt1 - 2^(1/2)*qt3)*I2;
 6*pi*(-2*2^(1/2)*qt2)*I1 - 6*pi*(-2*2^(1/2)*qt2)*I3 - 2*pi*I1*wt3 + 2*pi*I3*wt3;
                               2*pi*I1*wt2 - 2*pi*I2*wt2];
 
qdot = [  qt4/2 + (2^(1/2)*wt1)/4 + (2^(1/2)*wt3)/4 + 2^(1/2)/4;
                               qt3/2 + (2^(1/2)*wt2)/4;
 (2^(1/2)*wt3)/4 - (2^(1/2)*wt1)/4 - qt2/2 - 2^(1/2)/4;
                             - qt1/2 - (2^(1/2)*wt2)/4];

                         
elseif n == 7
% Equilibrium point 7:

wdot = [                               2*pi*I2*wt3 - 2*pi*I3*wt3;
                             6*pi*(2^(1/2)*qt2 - 2^(1/2)*qt3)*I1 - 6*pi*(2^(1/2)*qt2 - 2^(1/2)*qt3)*I3;
 6*pi*(2^(1/2)*qt3 - 2^(1/2)*qt2)*I2 - 6*pi*(2^(1/2)*qt3 - 2^(1/2)*qt2)*I1 + 2*pi*I1*wt1 - 2*pi*I2*wt1];
 
qdot = [                                (2^(1/2)*wt1)/4 - qt3/2;
 qt4/2 + (2^(1/2)*wt2)/4 + (2^(1/2)*wt3)/4 + 2^(1/2)/4;
 qt1/2 - (2^(1/2)*wt2)/4 + (2^(1/2)*wt3)/4 - 2^(1/2)/4;
                               (2^(1/2)*wt1)/4 - qt2/2];
 
elseif n == 8
% Equilibrium point 8:

wdot = [ 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I3 - 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I2 - 2*pi*I2*wt2 + 2*pi*I3*wt2;
                               2*pi*I1*wt1 - 2*pi*I3*wt1;
                             6*pi*(-2*2^(1/2)*qt2)*I2 - 6*pi*(-2*2^(1/2)*qt2)*I1];
 
qdot = [        (2^(1/2)*wt3)/4 - qt2/2 - 2^(1/2)/4;
       qt1/2 - (2^(1/2)*wt3)/4 + 2^(1/2)/4;
 (2^(1/2)*wt2)/4 - (2^(1/2)*wt1)/4 - qt4/2;
 qt3/2 - (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4];
 
elseif n == 9
% Equilibrium point 9:

wdot = [                             6*pi*(qt1 + qt2 - qt3 - qt4)*I3 - 6*pi*(qt1 + qt2 - qt3 - qt4)*I2;
 6*pi*(-2*qt2 - 2*qt3)*I1 - 6*pi*(-2*qt2 - 2*qt3)*I3 - 2*pi*I1*wt3 + 2*pi*I3*wt3;
                               2*pi*I1*wt2 - 2*pi*I2*wt2];
 
qdot = [    qt4/2 + wt1/4 - wt2/4 + wt3/4 + 1/4;
   qt3/2 + wt1/4 + wt2/4 - wt3/4 + 1/4;
   wt2/4 - wt1/4 - qt2/2 + wt3/4 - 1/4;
 -qt1/2 - wt1/4 - wt2/4 - wt3/4 - 1/4];
 
elseif n == 10
% Equilibrium point 10:

wdot = [ 6*pi*(2^(1/2)*qt2 - 2^(1/2)*qt1)*I3 - 6*pi*(2^(1/2)*qt2 - 2^(1/2)*qt1)*I2 + 2*pi*I2*wt2 - 2*pi*I3*wt2;
                               2*pi*I3*wt1 - 2*pi*I1*wt1;
                             6*pi*(2*2^(1/2)*qt3)*I2 - 6*pi*(2*2^(1/2)*qt3)*I1];
 
qdot = [  qt2/2 + (2^(1/2)*wt1)/4 + (2^(1/2)*wt2)/4;
 (2^(1/2)*wt2)/4 - (2^(1/2)*wt1)/4 - qt1/2;
       qt4/2 + (2^(1/2)*wt3)/4 + 2^(1/2)/4;
       (2^(1/2)*wt3)/4 - qt3/2 + 2^(1/2)/4];
 
elseif n == 11
% Equilibrium point 11:

wdot = [                             6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt2 + 1)*I3 - 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt2 + 1)*I2;
 6*pi*(-2*2^(1/2)*qt2)*I1 - 6*pi*(-2*2^(1/2)*qt2)*I3 - 2*pi*I1*wt3 + 2*pi*I3*wt3;
                               2*pi*I1*wt2 - 2*pi*I2*wt2];
 
qdot = [                                  qt4/2 + (2^(1/2)*wt3)/4;
                                 qt3/2 - (2^(1/2)*wt3)/4;
   (2^(1/2)*wt2)/4 - (2^(1/2)*wt1)/4 - qt2/2 - 2^(1/2)/4;
 - qt1/2 - (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4 - 2^(1/2)/4];
 
elseif n == 12
% Equilibrium point 12:

wdot = [                               2*pi*I3*wt3 - 2*pi*I2*wt3;
                             6*pi*(2^(1/2)*qt2 + 2^(1/2)*qt3)*I1 - 6*pi*(2^(1/2)*qt2 + 2^(1/2)*qt3)*I3;
 6*pi*(2^(1/2)*qt2 - 2^(1/2)*qt3)*I2 - 6*pi*(2^(1/2)*qt2 - 2^(1/2)*qt3)*I1 - 2*pi*I1*wt1 + 2*pi*I2*wt1];
 
qdot = [                                qt3/2 + (2^(1/2)*wt1)/4;
 (2^(1/2)*wt2)/4 - qt4/2 - (2^(1/2)*wt3)/4 - 2^(1/2)/4;
 (2^(1/2)*wt2)/4 - qt1/2 + (2^(1/2)*wt3)/4 - 2^(1/2)/4;
                               qt2/2 - (2^(1/2)*wt1)/4];
 
elseif n == 13
% Equilibrium point 13:

wdot = [                               2*pi*I2*wt2 - 2*pi*I3*wt2;
 6*pi*(-2*qt1)*I3 - 6*pi*(-2*qt1)*I1 - 2*pi*I1*wt1 + 2*pi*I3*wt1;
                             6*pi*(-2*qt1)*I1 - 6*pi*(-2*qt1)*I2];
 
qdot = [  qt2/2 - wt3/2 - 1/2;
             - qt1/2;
       qt4/2 + wt1/2;
       wt2/2 - qt3/2];
 
elseif n == 14
% Equilibrium point 14:

wdot = [ 6*pi*(2*qt1 + qt2 - qt3)*I2 - 6*pi*(2*qt1 + qt2 - qt3)*I3 + 2*pi*I2*wt3 - 2*pi*I3*wt3;
                                                       0;
 6*pi*(-2*qt2 - 2*qt3)*I1 - 6*pi*(-2*qt2 - 2*qt3)*I2 + 2*pi*I1*wt1 - 2*pi*I2*wt1];
 
qdot = [  wt1/4 - qt3/2 - wt2/4 + wt3/4 - 1/4;
 qt4/2 + wt1/4 + wt2/4 + wt3/4 + 1/4;
 qt1/2 - wt1/4 - wt2/4 + wt3/4 - 1/4;
 wt1/4 - qt2/2 - wt2/4 - wt3/4 - 1/4];
 
elseif n == 15
% Equilibrium point 15:

wdot = [                             6*pi*(qt1 - qt2 - qt3 + qt4)*I3 - 6*pi*(qt1 - qt2 - qt3 + qt4)*I2;
 6*pi*(-2*qt2 + 2*qt3)*I1 - 6*pi*(-2*qt2 + 2*qt3)*I3 - 2*pi*I1*wt3 + 2*pi*I3*wt3;
                               2*pi*I1*wt2 - 2*pi*I2*wt2];
 
qdot = [  qt4/2 + wt1/4 + wt2/4 + wt3/4 + 1/4;
 qt3/2 - wt1/4 + wt2/4 + wt3/4 - 1/4;
 wt3/4 - wt1/4 - wt2/4 - qt2/2 - 1/4;
 wt1/4 - qt1/2 - wt2/4 + wt3/4 + 1/4];
 
elseif n == 16
% Equilibrium point 16:

wdot = [                             6*pi*(qt2 - qt1 - qt3 + qt4)*I2 - 6*pi*(qt2 - qt1 - qt3 + qt4)*I3;
 6*pi*(2*qt2 + 2*qt3)*I3 - 6*pi*(2*qt2 + 2*qt3)*I1 + 2*pi*I1*wt3 - 2*pi*I3*wt3;
                               2*pi*I2*wt2 - 2*pi*I1*wt2];
 
qdot = [  wt1/4 - qt4/2 + wt2/4 - wt3/4 - 1/4;
 wt2/4 - wt1/4 - qt3/2 - wt3/4 + 1/4;
 qt2/2 + wt1/4 + wt2/4 + wt3/4 - 1/4;
 qt1/2 - wt1/4 + wt2/4 + wt3/4 + 1/4];
 
elseif n == 17
% Equilibrium point 17:

wdot = [ 6*pi*(qt2 + qt3)*I3 - 6*pi*(qt2 + qt3)*I2 - 2*pi*I2*wt3 + 2*pi*I3*wt3;
                                                       0;
 6*pi*(2*qt2 + 2*qt3)*I2 - 6*pi*(2*qt2 + 2*qt3)*I1 - 2*pi*I1*wt1 + 2*pi*I2*wt1];
 
qdot = [  qt3/2 + wt1/4 + wt2/4 + wt3/4 - 1/4;
 wt2/4 - wt1/4 - qt4/2 - wt3/4 - 1/4;
 wt2/4 - wt1/4 - qt1/2 + wt3/4 - 1/4;
 qt2/2 - wt1/4 - wt2/4 + wt3/4 + 1/4];
 
elseif n == 18
% Equilibrium point 18:

wdot = [                               2*pi*I3*wt2 - 2*pi*I2*wt2;
 6*pi*(-2*qt1)*I3 - 6*pi*(-2*qt1)*I1 + 2*pi*I1*wt1 - 2*pi*I3*wt1;
                             6*pi*(-2*qt1)*I1 - 6*pi*(-2*qt1)*I2];
 
qdot = [ -wt3/2 - qt2/2 + 1/2;
               qt1/2;
       wt1/2 - qt4/2;
       qt3/2 + wt2/2];
 
elseif n == 19
% Equilibrium point 19:

wdot = [ 6*pi*(qt2 + qt3)*I2 - 6*pi*(qt2 + qt3)*I3 - 2*pi*I2*wt3 + 2*pi*I3*wt3;
                                                       0;
 6*pi*(2*qt2 - 2*qt3)*I1 - 6*pi*(2*qt2 - 2*qt3)*I2 - 2*pi*I1*wt1 + 2*pi*I2*wt1];
 
qdot = [  qt3/2 + wt1/4 - wt2/4 - wt3/4 + 1/4;
 wt1/4 - qt4/2 + wt2/4 - wt3/4 - 1/4;
 wt1/4 - qt1/2 + wt2/4 + wt3/4 - 1/4;
 qt2/2 - wt1/4 + wt2/4 - wt3/4 - 1/4];
 
elseif n == 20
% Equilibrium point 20:

wdot = [                               2*pi*I3*wt2 - 2*pi*I2*wt2;
 6*pi*(-2*qt3)*I1 - 6*pi*(-2*qt3)*I3 + 2*pi*I1*wt1 - 2*pi*I3*wt1;
                             6*pi*(-2*qt2)*I2 - 6*pi*(-2*qt2)*I1];
 
qdot = [                -qt2/2;
  qt1/2 + wt3/2 - 1/2;
       -wt2/2 - qt4/2;
        qt3/2 + wt1/2];
 
elseif n == 21
% Equilibrium point 21:

wdot = [                             6*pi*(-qt2 - qt3 - qt4 - qt1)*I2 - 6*pi*(-qt2 - qt3 - qt4 - qt1)*I3;
 6*pi*(2*qt2 - 2*qt3)*I3 - 6*pi*(2*qt2 - 2*qt3)*I1 + 2*pi*I1*wt3 - 2*pi*I3*wt3;
                               2*pi*I2*wt2 - 2*pi*I1*wt2];
 
qdot = [  wt1/4 - qt4/2 - wt2/4 - wt3/4 - 1/4;
 wt1/4 - qt3/2 + wt2/4 + wt3/4 - 1/4;
 qt2/2 + wt1/4 - wt2/4 + wt3/4 - 1/4;
 qt1/2 + wt1/4 + wt2/4 - wt3/4 - 1/4];
 
elseif n == 22
% Equilibrium point 22:

wdot = [                             6*pi*(2^(1/2)*qt1 - 2^(1/2)*qt2 - 1)*I2 - 6*pi*(2^(1/2)*qt1 - 2^(1/2)*qt2 - 1)*I3;
 6*pi*(-2*2^(1/2)*qt2)*I3 - 6*pi*(-2*2^(1/2)*qt2)*I1 + 2*pi*I1*wt3 - 2*pi*I3*wt3;
                               2*pi*I2*wt2 - 2*pi*I1*wt2];
 
qdot = [                                (2^(1/2)*wt3)/4 - qt4/2;
                               (2^(1/2)*wt3)/4 - qt3/2;
 qt2/2 - (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4 + 2^(1/2)/4;
 qt1/2 + (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4 - 2^(1/2)/4];
 
elseif n == 23
% Equilibrium point 23:

wdot = [ 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I2 - 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I3 - 2*pi*I2*wt2 + 2*pi*I3*wt2;
                               2*pi*I1*wt1 - 2*pi*I3*wt1;
                             6*pi*(-2*2^(1/2)*qt2)*I1 - 6*pi*(-2*2^(1/2)*qt2)*I2];
 
qdot = [        (2^(1/2)*wt3)/4 - qt2/2 - 2^(1/2)/4;
       qt1/2 - (2^(1/2)*wt3)/4 + 2^(1/2)/4;
 (2^(1/2)*wt2)/4 - (2^(1/2)*wt1)/4 - qt4/2;
 qt3/2 - (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4];
 
elseif n == 24
% Equilibrium point 24:

wdot = [                               2*pi*I3*wt3 - 2*pi*I2*wt3;
                             6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I3 - 6*pi*(2^(1/2)*qt1 + 2^(1/2)*qt3)*I1;
 6*pi*(2*(2^(1/2)/2*qt1 + 2^(1/2)/2 + 1/2))*I1 - 6*pi*(2*(2^(1/2)/2*qt1 + 2^(1/2)/2 + 1/2))*I2 - 2*pi*I1*wt1 + 2*pi*I2*wt1];
 
qdot = [                                qt3/2 + (2^(1/2)*wt3)/4;
                              -(2^(1/2)*wt3)/4 - qt4/2;
 (2^(1/2)*wt2)/4 - (2^(1/2)*wt1)/4 - qt1/2 - 2^(1/2)/4;
 qt2/2 - (2^(1/2)*wt1)/4 - (2^(1/2)*wt2)/4 + 2^(1/2)/4];

end


eval(['[A' num2str(n) ', b' num2str(n) '] = equationsToMatrix([qdot(1) == qd1, qdot(2) == qd2, qdot(3) == qd3, qdot(4) == qd4, wdot(1)/I1 == wd1, wdot(2)/I2 == wd2, wdot(3)/I3 == wd3], [qt1, qt2, qt3, qt4, wt1, wt2, wt3])'])

% Notes:
% b vectors are appropriate.
% A matrices seem to match familiar results.
% Script breaks down at Eq13

% Error using symengine (line 58)
% Cannot convert to matrix form because the system does not seem to be linear.
% 
% Error in mupadengine/feval (line 155)
%                     symengine('error',S(8:find(S=='[',1)-2));
% 
% Error in sym/equationsToMatrix (line 50)
% T = eng.feval('symobj::equationsToMatrix',eqns,vars);
% 
% Error in sc_linearize (line 300)
% eval(['[A' num2str(n) ', b' num2str(n) '] = equationsToMatrix([qdot(1) == qd1,
% qdot(2) == qd2, qdot(3) == qd3, qdot(4) == qd4, wdot(1) == wd1, wdot(2) == wd2,
% wdot(3) == wd3], [qt1, qt2, qt3, qt4, wt

% and Eq24

% Error: File: sc_linearize.m Line: 289 Column: 102
% Unbalanced or unexpected parenthesis or bracket.


% USEFUL
eval(['g = matlabFunction(A' num2str(n) ');']);
eval(['A' num2str(n) ' = g(30, 40, 40);']);

% % ADD TO EACH POINT LATER:


% % Test for controllability:

eval(['Qc' num2str(n) ' = [];']);

for m = 1:7
    eval(['Qc' num2str(n) ' = [Qc' num2str(n) ' A' num2str(n) '^(m - 1)*B];']);
end

if eval(['rank(Qc' num2str(n) ') < 7'])
    error('Linear system is uncontrollable');
end

eval(['K' num2str(n) ' = place(A' num2str(n) ', B, [-1 -2 -3 -1.5 -0.5 -2.5 -4])']);

eval(['K = {K{:, :} K' num2str(n) '}']);

end