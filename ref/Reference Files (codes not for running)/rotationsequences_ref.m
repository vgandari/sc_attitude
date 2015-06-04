% function C = bodytwo313(theta1, theta2, theta3)
%     C = ;
% end

% body-three
% 123
C = [c2c3 -c2s3 s2;
    s1s2c3+s3c1 -s1s2s3+c3c1 -s1c2;
    -c1s2c3+s3s1 c1s2s3+c3s1 c1c2];

% 231
C = [c1c2 -c1s2c3+s3s1 c1s2s3+c3s1;
    s2 c2c3 -c2s3;
    -s1c2 s1s2c3+s3c1 -s1s2s3+c3c1];

% 312
C = [-s1s2s3+c3c1 -s1c2 s1s2c3+s3c1;
    c1s2s3+c3s1 c1c2  -c1s2c3+s3s1;
    -c2s3 s2 c2c3];

% 132
C = [c2c3 -s2 c2s3;
    c1s2c3+s3s1 c1c2 c1s2s3-c3s1;
    s1s2c3-s3c1 s1c2 s1s2s3+c3c1];

% 213
C = [s1s2s3+c3c1 s1s2c3-s3c1 s1c2;
    c2s3 c2c3 -s2;
    c1s2s3-c3s1 c1s2c3+s3s1 c1c2];

% 321
C = [c1c2 c1s2s3-c3s1 c1s2c3+s3s1;
    s1c2 s1s2s3+c3c1 s1s2c3-s3c1;
    -s2 c2s3 c2c3];

% body-two
% 121
C = [c2 s2s3 s2c3;
    s1s2 -s1c2s3+c3c1 -s1c2c3-s3c1;
    -c1s2 c1c2s3+c3s1 c1c2c3-s3s1];

% 131
C = [c2 -s2c3 s2s3;
    c1s2 c1c2c3-s3s1 -c1c2s3-c3s1;
    s1s2 s1c2c3+s3c1 -s1c2s3+c3c1];

% =========================================================================

% 212
C = [-s1c2s3+c3c1 s1s2 s1c2c3+s3c1;
    s2s3 c2 -s2c3;
    -c1c2s3-c3s1 c1s2 c1c2c3-s3s1];

% 232
C = [c1c2c3-s3s1 -c1s2 c1c2s3+c3s1;
    s2c3 c2 s2s3;
    -s1c2c3 s1s2 -s1c2s3+c3s1];

% 313
C = [-s1c2s3+c3c1 -s1c2c3-s3c1 s1s2;
    c1c2s3+c3s1 c1c2c3-s3s1 -c1s2;
    s2s3 s2c3 c2];

% 323
C = [c1c2c3-s3s1 -c1c2s3-c3s1 c1s2;
    s1c2c3+s3c1 -s1c2s3+c3c1 s1s2;
    -s2c3 s2s3 c2];

% space-three
% 123
C = [c2c3 s1s2c3-s3c1 c1s2c3+s3s1;
    c2s3 s1s2s3+c3c1 c1s2s3-c3s1;
    -s2 s1c2 c1c2];

% 231
C = [c1c2 -s2 s1c2;
    c1s2c3+s3s1 c2c3 s1s2c3-s3c1;
    c1s2s3-c3s1 c2s3 s1s2s3+c3c1];

% 312
C = [s1s2s3+c3c1 c1s2s3-c3s1 c2s3;
    s1c2 c1c2 -s2;
    s1s2c3-s3c1 c1s2c3+s3s1 c2c3];

% 132
C = [c2c3 -c1s2c3+s3s1 s1s2c3+s3c1;
    s2 c1c2 -s1c2;
    -c2s3 c1s2s3+c3s1 -s1s2s3+c3c1];

% 213
C = [-s1s2s3+c3c1 -c2s3 c1s2s3+c3s1;
    s1s2c3+s3c1 c2c3 -c1s2c3+s3s1;
    -s1c2 s2 c1c2];

% 321
C = [c1c2 -s1c2 s2;
    c1s2s3+c3s1 -s1s2s3+c3c1 -c2s3;
    -c1s2c3+s3s1 s1s2c3+s3c1 c2c3];

% space-two
% 121
C = [c2 s1s2 c1s2;
    s2s3 -s1c2s3+c3c1 -c1c2s3-c3s1;
    -s2c3 s1c2c3+s3c1 c1c2c3-s3s1];

% 131
C = [c2 -c1s2 s1s2;
    s2c3 c1c2c3-s3s1 -s1c2c3-s3c1;
    s2s3 c1c2s3+c3s1 -s1c2s3+c3c1];

% 212
C = [-s1c2s3+c3c1 s2s3 c1c2s3+c3s1;
    s1s2 c2 -c1s2;
    -s1c2c3-s3c1 s2c3 c1c2c3-s3s1];

% 232
C = [c1c2c3-s3s1 -s2c3 s1c2c3+s3c1;
    c1s2 c2 s1s2;
    -c1c2s3-c1s1 s2s3 -s1c2s3+c3c1];

% 313
C = [-s1c2s3+c3c1 -c1c2s3-c3s1 s2s3;
    s1c2c3+s3c1 c1c2c3-s3s1 -s2c3;
    s1s2 c1s2 c2];

% 323
C = [c1c2c3-s3s1 -s1c2c3-s3c1 s2c3;
    c1c2s3+c3s1 -s1c2s3+c3c1 s2s3;
    -c1s2 s1s2 c2];

