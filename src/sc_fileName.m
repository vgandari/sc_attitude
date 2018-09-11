function fileName = sc_fileName(IC)

vehicle = 'sc';
model = 'attitude';
env = {'torque_free';
       'spinup';
       'circular_orbit';
       'elliptical_orbit'};

%config1 = [gyro
config2 = {'r1';
          'r2';
          'r3';
          'r4';
          'r5';
          'r6';
          'r7';
          'asymmetric';
          'symmetric';
          'gyrostats'}; % gets redefined as gyros are appended

initialID = {'rad';
             'tan';
             'norm'};

% GET FIRST TWO DIGITS OF EACH PMOI AND RATIOS
[K1, ek1] = getTwoDigit(IC(11));
[K2, ek2] = getTwoDigit(IC(12));
[K3, ek3] = getTwoDigit(IC(13));
[I1, ei1] = getTwoDigit(IC(8));
[I2, ei2] = getTwoDigit(IC(9));
[I3, ei3] = getTwoDigit(IC(10));
massprops = [signBool(IC(11:13)) 'K' K1 K2 K3 '_I' I1 I2 I3];

% largest
switch max(IC(8:10))
case IC(8)
massprops = ['x' massprops];
case IC(9)
massprops = ['y' massprops];
case IC(10)
massprops = ['z' massprops];
end

% smallest
switch min(IC(8:10))
case IC(8)
massprops = [massprops 'x'];
case IC(9)
massprops = [massprops 'y'];
case IC(10)
massprops = [massprops 'z'];
end

% spherical massprops (should only be xABCxx since min and max return first value)
if max(IC(8:10)) == min(IC(8:10))
massprops = [massprops massprops(1)];
% intermediate axis for asymmetric body
elseif (max(IC(8:10)) == IC(8) && min(IC(8:10)) == IC(9)) || (max(IC(8:10)) == IC(9) && min(IC(8:10)) == IC(8))
massprops = [massprops 'z'];
elseif (max(IC(8:10)) == IC(8) && min(IC(8:10)) == IC(10)) || (max(IC(8:10)) == IC(10) && min(IC(8:10)) == IC(8))
massprops = [massprops 'y'];
elseif (max(IC(8:10)) == IC(9) && min(IC(8:10)) == IC(10)) || (max(IC(8:10)) == IC(10) && min(IC(8:10)) == IC(9))
massprops = [massprops 'x'];
else
% nonspherical mass properties
  if massprops(1) == 'x' && massprops(length(massprops)) == 'y'
    massprops = [massprops 'z'];
  elseif massprops(1) == 'x' && massprops(length(massprops)) == 'z'
    massprops = [massprops 'y'];
  elseif massprops(1) == 'y' && massprops(length(massprops)) == 'x'
    massprops = [massprops 'z'];
  elseif massprops(1) == 'y' && massprops(length(massprops)) == 'z'
    massprops = [massprops 'x'];
  elseif massprops(1) == 'z' && massprops(length(massprops)) == 'x'
    massprops = [massprops 'y'];
  elseif massprops(1) == 'z' && massprops(length(massprops)) == 'y'
    massprops = [massprops 'x'];
  end
end
%minEk = min(ek1, ek2, ek3);
%massprops = [massprops 'E' num2str(ek1-minEk) num2str(ek2-minEk) num2str(ek3-minEk)]

% initial angular velocity
wLabel = [signBool(IC(5:7)) 'w' getTwoDigit(IC(5)) getTwoDigit(IC(6)) getTwoDigit(IC(7))];
% initial orientation
qLabel = [signBool(IC(1:4)) 'q' getTwoDigit(IC(1)) getTwoDigit(IC(2)) getTwoDigit(IC(3)) getTwoDigit(IC(4))];


config = cell2mat(config2(1));

ind_omega0_max = logical(max(IC(1:3)) == IC(1:3));
initialID{ind_omega0_max};
initialID = cell2mat(initialID(1));

fileName = [vehicle '_' model '_' cell2mat(env(1)) '_' config '_' initialID '_' massprops '_' wLabel '_' qLabel];

end
