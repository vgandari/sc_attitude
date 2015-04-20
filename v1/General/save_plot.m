function save_plot(h, file_name)
% Save plot as eps and pdf.
% Inputs
% h         - figure handle
% file_name - name of file

    if nargin == 1
        h = gcf;
    end
    print2eps(horzcat(file_name, '.eps'), h);
    eps2pdf(horzcat(file_name, '.eps'), horzcat(file_name, '.pdf'));
end