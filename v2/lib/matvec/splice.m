function [t, arr] = splice(t1, t2, arr1, arr2)
% Function description
% 
% Inputs
% t1   - vector, independent variable
% t2   - vector, independent variable
% arr1 - vector, dependent variable
% arr2 - vector, dependent variable
% 
% Outputs
% t    - vector, ordered set consisting of t1 and t2
% arr  - vector, set containing arr1 and arr2 whose indices correspond to t
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last Updated: 20150428
% 
% :TODO:
% Uncomment error line
% Complete header
% Write function
% Add error checking code

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
fname='splice';
% error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
% warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
    warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------

% ARRAY INDICES TO TEST
ii = 1;
j = 1;
k = 1;

% SPLICE ARRAYS arr1 AND arr2
while j <=length(t1) || ii <=length(t2)
    % TEST: REACH END OF arr1, arr1 LONGER THAN arr2
    if j > length(t2) && ii == length(t1)
        t(k) = t1(ii);
        arr(k) = arr1(ii);
        j = j + 1;
    % TEST: REACH END OF arr2; arr2 LONGER THAN arr1
    if ii > length(t1) && j == length(t2)
        t(k) = t2(j);
        arr(k) = arr2(j);
        
    % INCLUDE ELEMENTS OF arr2 UNTIL REACHING t1(ii)
    elseif t1(ii) > t2(j)
        t(k) = t1(ii);
        arr(k) = arr2(j);
        % GO TO NEXT ELEMENT OF t2, arr2 FOR NEXT COMPARISON
        j = j + 1;
    % INCLUDE ELEMENTS OF arr1 UNTIL REACHING t2(j)
    elseif t1(ii) < t2(j)
        t(k) = t2(j);
        arr(k) = arr1(ii);
        % GO TO NEXT ELEMENT OF t1, arr1 FOR NEXT COMPARISON
        ii = ii + 1;
    % INCLUDE ELEMENTS OF EITHER ARRAY (arr1 HARCODED) IF EQUAL
    elseif t1(ii) == t2(j)
        t(k) = t1(ii);
        arr(k) = arr1(ii);
        % CHANGE BOTH INDICES FOR NEXT COMPARISON
        ii = ii + 1;
        j = j + 1;
    end
    k = k + 1;
end       

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
