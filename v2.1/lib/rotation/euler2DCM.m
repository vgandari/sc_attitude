function C = euler2DCM(bs, type, phi, theta, psi)
% Calculates direction cosine matrix from Euler
% angles [rad] and specified Euler type and sequence
%
% Inputs
% bs    - string, body or space sequence type
% type  - scalar, three digit number specifying sequence
%
% Outputs
% phi     - scalar, float, first angle in the sequence
% theta   - scalar, float, second angle in the sequence
% psi     - scalar, float, third angle in the sequence
%
% Victor Gandarillas
% gandarillasv@gmail.com
%
% Last Updated: 20150501
%

% :TODO: the next task
% :BUG: thing to fix
% :KLUDGE: why code is ugly
% :TRICKY: sleep on it before editing again
% :WARNING: be careful to/not to write code this way
% :COMPILER: compiler problems
% :ATTRIBUTE: value

% -------------------------------------------------------------------------
% !!! EDIT THESE LINES BEFORE EACH EDIT/SAVE/RUN !!!
% -------------------------------------------------------------------------
fname='euler2DCM';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);

warning([fname, ':TODO: Simplify code'])

% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------
q=[];


    if bs ~= 'b' && bs ~= 's'
        error('Input must be string of value ''b''or''s\n');
    elseif bs == 'b'
        if type == 123
            % body-three
            % 123
            C = [cos(theta)*cos(psi) -cos(theta)*sin(psi) sin(theta);
                sin(phi)*sin(theta)*cos(psi)+sin(psi)*cos(phi) -sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) -sin(phi)*cos(theta);
                -cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) cos(phi)*sin(theta)*sin(psi)+cos(psi)*sin(phi) cos(phi)*cos(theta)];
        elseif type == 231
            % body-three
            % 231
            C = [cos(phi)*cos(theta) -cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) cos(phi)*sin(theta)*sin(psi)+cos(psi)*sin(phi);
                sin(theta) cos(theta)*cos(psi) -cos(theta)*sin(psi);
                -sin(phi)*cos(theta) sin(phi)*sin(theta)*cos(psi)+sin(psi)*cos(phi) -sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi)];
        elseif type == 312
            % body-three
            % 312
            C = [-sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) -sin(phi)*cos(theta) sin(phi)*sin(theta)*cos(psi)+sin(psi)*cos(phi);
                cos(phi)*sin(theta)*sin(psi)+cos(psi)*sin(phi) cos(phi)*cos(theta)  -cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi);
                -cos(theta)*sin(psi) sin(theta) cos(theta)*cos(psi)];
        elseif type == 132
            % body-three
            % 132
            C = [cos(theta)*cos(psi) -sin(theta) cos(theta)*sin(psi);
                cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) cos(phi)*cos(theta) cos(phi)*sin(theta)*sin(psi)-cos(psi)*sin(phi);
                sin(phi)*sin(theta)*cos(psi)-sin(psi)*cos(phi) sin(phi)*cos(theta) sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi)];
        elseif type == 213
            % body-three
            % 213
            C = [sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) sin(phi)*sin(theta)*cos(psi)-sin(psi)*cos(phi) sin(phi)*cos(theta);
                cos(theta)*sin(psi) cos(theta)*cos(psi) -sin(theta);
                cos(phi)*sin(theta)*sin(psi)-cos(psi)*sin(phi) cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) cos(phi)*cos(theta)];
        elseif type == 321
            % body-three
            % 321
            C = [cos(phi)*cos(theta) cos(phi)*sin(theta)*sin(psi)-cos(psi)*sin(phi) cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi);
                sin(phi)*cos(theta) sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) sin(phi)*sin(theta)*cos(psi)-sin(psi)*cos(phi);
                -sin(theta) cos(theta)*sin(psi) cos(theta)*cos(psi)];
        elseif type == 121
            % body-two
            % 121
            C = [cos(theta) sin(theta)*sin(psi) sin(theta)*cos(psi);
                sin(phi)*sin(theta) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) -sin(phi)*cos(theta)*cos(psi)-sin(psi)*cos(phi);
                -cos(phi)*sin(theta) cos(phi)*cos(theta)*sin(psi)+cos(psi)*sin(phi) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi)];
        elseif type == 131
            % body-two
            % 131
            C = [cos(theta) -sin(theta)*cos(psi) sin(theta)*sin(psi);
                cos(phi)*sin(theta) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -cos(phi)*cos(theta)*sin(psi)-cos(psi)*sin(phi);
                sin(phi)*sin(theta) sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi)];
        elseif type == 212
            % body-two
            % 212
            C = [-sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) sin(phi)*sin(theta) sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi);
                sin(theta)*sin(psi) cos(theta) -sin(theta)*cos(psi);
                -cos(phi)*cos(theta)*sin(psi)-cos(psi)*sin(phi) cos(phi)*sin(theta) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi)];
        elseif type == 232
            % body-two
            % 232
            C = [cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -cos(phi)*sin(theta) cos(phi)*cos(theta)*sin(psi)+cos(psi)*sin(phi);
                sin(theta)*cos(psi) cos(theta) sin(theta)*sin(psi);
                -sin(phi)*cos(theta)*cos(psi) sin(phi)*sin(theta) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*sin(phi)];
        elseif type == 313
            % body-two
            % 313
            C = [-sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) -sin(phi)*cos(theta)*cos(psi)-sin(psi)*cos(phi) sin(phi)*sin(theta);
                cos(phi)*cos(theta)*sin(psi)+cos(psi)*sin(phi) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -cos(phi)*sin(theta);
                sin(theta)*sin(psi) sin(theta)*cos(psi) cos(theta)];
         elseif type == 323
            % body-two
            % 323
            C = [cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -cos(phi)*cos(theta)*sin(psi)-cos(psi)*sin(phi) cos(phi)*sin(theta);
                sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) sin(phi)*sin(theta);
                -sin(theta)*cos(psi) sin(theta)*sin(psi) cos(theta)];
        end
    elseif bs == 's'
        if type == 123
            % space-three
            % 123
            C = [cos(theta)*cos(psi) sin(phi)*sin(theta)*cos(psi)-sin(psi)*cos(phi) cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi);
                cos(theta)*sin(psi) sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) cos(phi)*sin(theta)*sin(psi)-cos(psi)*sin(phi);
                -sin(theta) sin(phi)*cos(theta) cos(phi)*cos(theta)];
        elseif type == 231
            % space-three
            % 231
            C = [cos(phi)*cos(theta) -sin(theta) sin(phi)*cos(theta);
                cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) cos(theta)*cos(psi) sin(phi)*sin(theta)*cos(psi)-sin(psi)*cos(phi);
                cos(phi)*sin(theta)*sin(psi)-cos(psi)*sin(phi) cos(theta)*sin(psi) sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi)];
        elseif type == 312
            % space-three
            % 312
            C = [sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) cos(phi)*sin(theta)*sin(psi)-cos(psi)*sin(phi) cos(theta)*sin(psi);
                sin(phi)*cos(theta) cos(phi)*cos(theta) -sin(theta);
                sin(phi)*sin(theta)*cos(psi)-sin(psi)*cos(phi) cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) cos(theta)*cos(psi)];
        elseif type == 132
            % space-three
            % 132
            C = [cos(theta)*cos(psi) -cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) sin(phi)*sin(theta)*cos(psi)+sin(psi)*cos(phi);
                sin(theta) cos(phi)*cos(theta) -sin(phi)*cos(theta);
                -cos(theta)*sin(psi) cos(phi)*sin(theta)*sin(psi)+cos(psi)*sin(phi) -sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi)];
        elseif type == 213
            % space-three
            % 213
            C = [-sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) -cos(theta)*sin(psi) cos(phi)*sin(theta)*sin(psi)+cos(psi)*sin(phi);
                sin(phi)*sin(theta)*cos(psi)+sin(psi)*cos(phi) cos(theta)*cos(psi) -cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi);
                -sin(phi)*cos(theta) sin(theta) cos(phi)*cos(theta)];
        elseif type == 321
            % space-three
            % 321
            C = [cos(phi)*cos(theta) -sin(phi)*cos(theta) sin(theta);
                cos(phi)*sin(theta)*sin(psi)+cos(psi)*sin(phi) -sin(phi)*sin(theta)*sin(psi)+cos(psi)*cos(phi) -cos(theta)*sin(psi);
                -cos(phi)*sin(theta)*cos(psi)+sin(psi)*sin(phi) sin(phi)*sin(theta)*cos(psi)+sin(psi)*cos(phi) cos(theta)*cos(psi)];
        elseif type == 121
            % space-two
            % 121
            C = [cos(theta) sin(phi)*sin(theta) cos(phi)*sin(theta);
                sin(theta)*sin(psi) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) -cos(phi)*cos(theta)*sin(psi)-cos(psi)*sin(phi);
                -sin(theta)*cos(psi) sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi)];
        elseif type == 131
            % space-two
            % 131
            C = [cos(theta) -cos(phi)*sin(theta) sin(phi)*sin(theta);
                sin(theta)*cos(psi) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -sin(phi)*cos(theta)*cos(psi)-sin(psi)*cos(phi);
                sin(theta)*sin(psi) cos(phi)*cos(theta)*sin(psi)+cos(psi)*sin(phi) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi)];
        elseif type == 212
            % space-two
            % 212
            C = [-sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) sin(theta)*sin(psi) cos(phi)*cos(theta)*sin(psi)+cos(psi)*sin(phi);
                sin(phi)*sin(theta) cos(theta) -cos(phi)*sin(theta);
                -sin(phi)*cos(theta)*cos(psi)-sin(psi)*cos(phi) sin(theta)*cos(psi) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi)];
        elseif type == 232
            % space-two
            % 232
            C = [cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -sin(theta)*cos(psi) sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi);
                cos(phi)*sin(theta) cos(theta) sin(phi)*sin(theta);
                -cos(phi)*cos(theta)*sin(psi)-cos(phi)*sin(phi) sin(theta)*sin(psi) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi)];
        elseif type == 313
            % space-two
            % 313
            C = [-sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) -cos(phi)*cos(theta)*sin(psi)-cos(psi)*sin(phi) sin(theta)*sin(psi);
                sin(phi)*cos(theta)*cos(psi)+sin(psi)*cos(phi) cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -sin(theta)*cos(psi);
                sin(phi)*sin(theta) cos(phi)*sin(theta) cos(theta)];
        elseif type == 323
            % space-two
            % 323
            C = [cos(phi)*cos(theta)*cos(psi)-sin(psi)*sin(phi) -sin(phi)*cos(theta)*cos(psi)-sin(psi)*cos(phi) sin(theta)*cos(psi);
                cos(phi)*cos(theta)*sin(psi)+cos(psi)*sin(phi) -sin(phi)*cos(theta)*sin(psi)+cos(psi)*cos(phi) sin(theta)*sin(psi);
                -cos(phi)*sin(theta) sin(phi)*sin(theta) cos(theta)];
        end
    end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end


