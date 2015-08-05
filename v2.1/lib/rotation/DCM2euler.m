function [psi, theta, phi] = DCM2euler(bs, type, C)
% This function calculates Euler angles from a direction cosine matrix and
% a specified Euler Angle Sequence. The direction cosine matrix is assumed
% to be a column operatore (i.e. wdot = C*w as opposed to wdot = w*C). The
% angles are returned in radians. For a 313 sequence, psi, theta, and phi
% correspond to precession, nutation, and spin angles, respectively.
    
C = C'; % C is treated as a row operator in the calculations below. This
        % changes C from a column operator (i.e. wdot = C*w) to a row
        % operator (i.e. wdot = w*C). Comment or remove to treat C as a row
        % operator (if you like using left vectors in your code).

    if bs ~= 'b' && bs ~= 's'
        error('Input must be string of value ''b''or''s\n');
    elseif bs == 'b'
        if type == 123
            % body-three
            % 123
            psi = atan2(-C(2, 3), C(3, 3));
            phi = atan2(-C(1, 2), C(1, 1));
            theta = atan2(C(1, 3), C(1, 1)/cos(phi));
        elseif type == 231
            % body-three
            % 231
            psi = atan2(-C(3, 1), C(1, 1));
            phi = atan2(-C(2, 3), C(2, 2));
            theta = atan2(C(2, 1), C(1, 1)/cos(psi));
        elseif type == 312
            % body-three
            % 312
            psi = atan2(-C(1, 2), C(2, 2));
            phi = atan2(-C(3, 1), C(3, 3));
            theta = atan2(C(3, 2), C(3, 3)/cos(phi));
        elseif type == 132
            % body-three
            % 132
            psi = atan2(C(3, 2), C(2, 2));
            phi = atan2(C(1, 3), C(1, 1));
            theta = atan2(-C(1, 2), C(1, 1)/cos(phi));
        elseif type == 213
            % body-three
            % 213
            psi = atan2(C(1, 3), C(3, 3));
            phi = atan2(C(2, 1), C(2, 2));
            theta = atan2(-C(2, 3), C(2, 2)/cos(phi));
        elseif type == 321
            % body-three
            % 321
            psi = atan2(C(2, 1), C(1, 1));
            phi = atan2(C(3, 2), C(3, 3));
            theta = atan2(-C(3, 1), C(3, 3)/cos(phi));
        elseif type == 121
            % body-two
            % 121
            psi = atan2(C(2, 1), -C(3, 1));
            phi = atan2(C(1, 2), C(1, 3));
            theta = atan2(C(1, 3)/cos(phi), C(1, 1));
        elseif type == 131
            % body-two
            % 131
            psi = atan2(C(3, 1), C(2, 1));
            phi = atan2(C(1, 3), -C(1, 2));
            theta = atan2(C(1, 3)/sin(phi), C(1, 1));
        elseif type == 212
            % body-two
            % 212
            psi = atan2(C(1, 2), C(3, 2));
            phi = atan2(C(2, 1), -C(2, 3));
            theta = atan2(C(2, 1)/sin(phi), C(2, 2));
        elseif type == 232
            % body-two
            % 232
            psi = atan2(C(3, 2), -C(1, 2));
            phi = atan2(C(2, 3), C(2, 1));
            theta = atan2(C(2, 1)/cos(phi), C(2, 2));
        elseif type == 313 % VERIFIED
            % body-two
            % 313
            psi = atan_quad(C(1, 3), -C(2, 3));
            phi = atan_quad(C(3, 1), C(3, 2));
%             theta = atan_quad(C(3, 2)/cos(phi), C(3, 3));
            theta = acos(C(3, 3));
         elseif type == 323 % VERIFIED
            % body-two
            % 323
            psi = atan_quad(C(2, 3), C(1, 3));
            phi = atan_quad(C(3, 2), -C(3, 1));
%             theta = atan_quad(C(3, 2)/sin(phi), C(3, 3));
            
            theta = acos(C(3, 3));
        end
    elseif bs == 's'
        if type == 123
            % space-three
            % 123
            psi = atan2(C(3, 2), C(3, 3));
            phi = atan2(C(2, 1), C(1, 1));
            theta = atan2(C(3, 2)/cos(phi), C(3, 3));
%             C = [cos(theta)*cos(phi) sin(psi)*sin(theta)*cos(phi)-sin(phi)*cos(psi) cos(psi)*sin(theta)*cos(phi)+sin(phi)*sin(psi);
%                 cos(theta)*sin(phi) sin(psi)*sin(theta)*sin(phi)+cos(phi)*cos(psi) cos(psi)*sin(theta)*sin(phi)-cos(phi)*sin(psi);
%                 -sin(theta) sin(psi)*cos(theta) cos(psi)*cos(theta)];
        elseif type == 231
            % space-three
            % 231
            psi = atan2(C(1, 3), C(1, 1));
            phi = atan2(C(3, 2), C(2, 2));
            theta = atan2(-C(1, 2), C(1, 1)/cos(psi));
%             C = [cos(psi)*cos(theta) -sin(theta) sin(psi)*cos(theta);
%                 cos(psi)*sin(theta)*cos(phi)+sin(phi)*sin(psi) cos(theta)*cos(phi) sin(psi)*sin(theta)*cos(phi)-sin(phi)*cos(psi);
%                 cos(psi)*sin(theta)*sin(phi)-cos(phi)*sin(psi) cos(theta)*sin(phi) sin(psi)*sin(theta)*sin(phi)+cos(phi)*cos(psi)];
        elseif type == 312
            % space-three
            % 312
            psi = atan2(C(2, 1), C(2, 2));
            phi = atan2(C(1, 3), C(3, 3));
            theta = atan2(-C(2, 3), C(2, 2)/cos(psi));
%             C = [sin(psi)*sin(theta)*sin(phi)+cos(phi)*cos(psi) cos(psi)*sin(theta)*sin(phi)-cos(phi)*sin(psi) cos(theta)*sin(phi);
%                 sin(psi)*cos(theta) cos(psi)*cos(theta) -sin(theta);
%                 sin(psi)*sin(theta)*cos(phi)-sin(phi)*cos(psi) cos(psi)*sin(theta)*cos(phi)+sin(phi)*sin(psi) cos(theta)*cos(phi)];
        elseif type == 132
            % space-three
            % 132
            psi = atan2(-C(2, 3), C(2, 1));
            phi = atan2(-C(3, 1), C(1, 1));
            theta = atan2(C(2, 1), C(2, 2)/cos(psi));
%             C = [cos(theta)*cos(phi) -cos(psi)*sin(theta)*cos(phi)+sin(phi)*sin(psi) sin(psi)*sin(theta)*cos(phi)+sin(phi)*cos(psi);
%                 sin(theta) cos(psi)*cos(theta) -sin(psi)*cos(theta);
%                 -cos(theta)*sin(phi) cos(psi)*sin(theta)*sin(phi)+cos(phi)*sin(psi) -sin(psi)*sin(theta)*sin(phi)+cos(phi)*cos(psi)];
        elseif type == 213
            % space-three
            % 213
            psi = atan2(-C(3, 1), C(3, 3));
            phi = atan2(-C(3, 2), C(2, 2));
            theta = atan2(C(3, 2), C(3, 3)/cos(psi));
%             C = [-sin(psi)*sin(theta)*sin(phi)+cos(phi)*cos(psi) -cos(theta)*sin(phi) cos(psi)*sin(theta)*sin(phi)+cos(phi)*sin(psi);
%                 sin(psi)*sin(theta)*cos(phi)+sin(phi)*cos(psi) cos(theta)*cos(phi) -cos(psi)*sin(theta)*cos(phi)+sin(phi)*sin(psi);
%                 -sin(psi)*cos(theta) sin(theta) cos(psi)*cos(theta)];
        elseif type == 321
            % space-three
            % 321
            psi = atan2(-C(3, 2), C(1, 1));
            phi = atan2(-C(2, 3), C(3, 3));
            theta = atan2(C(1, 3), C(1, 1)/cos(psi));
%             C = [cos(psi)*cos(theta) -sin(psi)*cos(theta) sin(theta);
%                 cos(psi)*sin(theta)*sin(phi)+cos(phi)*sin(psi) -sin(psi)*sin(theta)*sin(phi)+cos(phi)*cos(psi) -cos(theta)*sin(phi);
%                 -cos(psi)*sin(theta)*cos(phi)+sin(phi)*sin(psi) sin(psi)*sin(theta)*cos(phi)+sin(phi)*cos(psi) cos(theta)*cos(phi)];
        elseif type == 121
            % space-two
            % 121
            psi = atan2(C(1, 2), C(1, 3));
            phi = atan2(C(2, 1), -C(3, 1));
            theta = atan2(C(1, 2)/sin(phi), C(1, 1));
%             C = [cos(theta) sin(psi)*sin(theta) cos(psi)*sin(theta);
%                 sin(theta)*sin(phi) -sin(psi)*cos(theta)*sin(phi)+cos(phi)*cos(psi) -cos(psi)*cos(theta)*sin(phi)-cos(phi)*sin(psi);
%                 -sin(theta)*cos(phi) sin(psi)*cos(theta)*cos(phi)+sin(phi)*cos(psi) cos(psi)*cos(theta)*cos(phi)-sin(phi)*sin(psi)];
        elseif type == 131
            % space-two
            % 131
            psi = atan2(C(1, 3), -C(1, 2));
            phi = atan2(C(3, 1), C(2, 1));
            theta = atan2(C(2, 1)/cos(phi), C(1, 1));
%             C = [cos(theta) -cos(psi)*sin(theta) sin(psi)*sin(theta);
%                 sin(theta)*cos(phi) cos(psi)*cos(theta)*cos(phi)-sin(phi)*sin(psi) -sin(psi)*cos(theta)*cos(phi)-sin(phi)*cos(psi);
%                 sin(theta)*sin(phi) cos(psi)*cos(theta)*sin(phi)+cos(phi)*sin(psi) -sin(psi)*cos(theta)*sin(phi)+cos(phi)*cos(psi)];
        elseif type == 212
            % space-two
            % 212
            psi = atan2(C(2, 1), -C(2, 3));
            phi = atan2(C(1, 2), C(3, 2));
            theta = atan2(C(2, 1)/sin(psi), C(2, 2));
%             C = [-sin(psi)*cos(theta)*sin(phi)+cos(phi)*cos(psi) sin(theta)*sin(phi) cos(psi)*cos(theta)*sin(phi)+cos(phi)*sin(psi);
%                 sin(psi)*sin(theta) cos(theta) -cos(psi)*sin(theta);
%                 -sin(psi)*cos(theta)*cos(phi)-sin(phi)*cos(psi) sin(theta)*cos(phi) cos(psi)*cos(theta)*cos(phi)-sin(phi)*sin(psi)];
        elseif type == 232
            % space-two
            % 232
            psi = atan2(C(2, 3), C(2, 1));
            phi = atan2(C(3, 2), -C(1, 2));
            theta = atan2(C(2, 1)/cos(psi), C(2, 2));
%             C = [cos(psi)*cos(theta)*cos(phi)-sin(phi)*sin(psi) -sin(theta)*cos(phi) sin(psi)*cos(theta)*cos(phi)+sin(phi)*cos(psi);
%                 cos(psi)*sin(theta) cos(theta) sin(psi)*sin(theta);
%                 -cos(psi)*cos(theta)*sin(phi)-cos(psi)*sin(psi) sin(theta)*sin(phi) -sin(psi)*cos(theta)*sin(phi)+cos(phi)*cos(psi)];
        elseif type == 313
            % space-two
            % 313
            psi = atan2(C(3, 1), C(3, 2));
            phi = atan2(C(1, 3), -C(2, 3));
            theta = atan2(C(3, 2)/cos(psi), C(3, 3));
%             C = [-sin(psi)*cos(theta)*sin(phi)+cos(phi)*cos(psi) -cos(psi)*cos(theta)*sin(phi)-cos(phi)*sin(psi) sin(theta)*sin(phi);
%                 sin(psi)*cos(theta)*cos(phi)+sin(phi)*cos(psi) cos(psi)*cos(theta)*cos(phi)-sin(phi)*sin(psi) -sin(theta)*cos(phi);
%                 sin(psi)*sin(theta) cos(psi)*sin(theta) cos(theta)];
        elseif type == 323
            % space-two
            % 323
            psi = atan2(C(3, 2), -C(3, 1));
            phi = atan2(C(2, 3), C(1, 3));
            theta = atan2(C(3, 2)/sin(psi), C(3, 3));
            C = [cos(psi)*cos(theta)*cos(phi)-sin(phi)*sin(psi) -sin(psi)*cos(theta)*cos(phi)-sin(phi)*cos(psi) sin(theta)*cos(phi);
                cos(psi)*cos(theta)*sin(phi)+cos(phi)*sin(psi) -sin(psi)*cos(theta)*sin(phi)+cos(phi)*cos(psi) sin(theta)*sin(phi);
                -cos(psi)*sin(theta) sin(psi)*sin(theta) cos(theta)];
        end
    end
end

