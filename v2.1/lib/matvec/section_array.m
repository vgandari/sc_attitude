function subset = section_array(section, no_of_sections, array)
% This function resizes an array to include only information from a
% specified section. For example, the third fifth of an array n of length
% 25 is n(11:15), so if n = section_array(3, 5, n), n is redefined as
% n = n(11:15). The section to be extracted (section=3) and the total
% number of sections (no_of_sections=5) are extracted.
%
% Inputs
% array - array to be read
% secno - number of sections to divide array
% sec   - section of array to extract
%
% OutputS
% subset - subset of array to extract
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
fname='section_array';
error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);

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

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end

%     if  ~(floor(section) ~= section>0) || ~(isinteger(no_of_sections)>0) || ...
%             section > no_of_sections || min(size(array)) ~= 1 || ...
%             isinteger(length(array)/no_of_sections)
%         error('a and b must be positive integers, n must be array, n must be divisible by b, and a <= b');
%     else
        subset = array((section - 1)*length(array)/no_of_sections + 1 ...
            :section*length(array)/no_of_sections);
%     end
end
