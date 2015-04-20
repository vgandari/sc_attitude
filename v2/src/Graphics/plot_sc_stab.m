function plot_sc_stab(K1, K2, author)
% This function plots the spacecraft stability boundaries with a point
% representing the spacecraft's mass property ratios. Regions are labeled
% 1-7. Region 1 is stable, while Region 7 is not guaranteed to be stable
% for all initial conditions. Stabilizing rotors are not taken into
% account.

figure
hold on

% Define search range for K1 (X coordinate of R5/R7 decision boundary)
xr57 = 0:0.001:1;
b = length(xr57);

% Start of decision boundary coordinates array (redefined to exclude R4)
m = 1;

% Define R5/R7 boundary
for n = 1:b
    % Parametrize R5/R7 decision boundary
    myfun = @(y,x) (1 - x.*y + 3*y).^2 + 16*x.*y;
    % R5/R7 decision boundary as function of xr57
    fun = @(y) myfun(y,xr57(n));
    % Calculate Y coordinates of decision boundary (where condition = 0)
    yr57(n) = fzero(fun,0);
    % Exclude boundary in R4
    if abs(yr57(n)) >= abs(xr57(n))
        m = n;
    end
end

plot(K1, K2, 'o', [-1 1], [1 1], [-1 1], [-1 -1], [1 1], [-1 1], ...
    [-1 -1], [-1 1], [-1 1], [0 0], [0 0], [-1 1], [-1 1], [1 -1], ...
    xr57(m:b), yr57(m:b))
axis([-1.25 1.25 -1.25 1.25])
suptitle(horzcat(author, ' - Spacecraft Inertia Ratios, Stable Regions'))
xlabel(['K_', num2str(1)])
ylabel(['K_', num2str(2)])
text(-0.25, 0.75, '1')
text(-0.75, 0.25, '2')
text(-0.75, -0.75, '3')
text(0.25, -0.75, '4')
text(0.5, 0.5, '6')
text(0.75, -0.5, '5')
text(0.1, -0.075, '7')

% print2eps('stability_chart.eps')
% eps2pdf('stability_chart.eps', 'stability_chart.pdf')