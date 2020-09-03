
NonlinearVariable = 'FullGameDFA vs ' % Change the variable in the title to reflect what you are plotting
filepath = '/Users/joelsommerfeld/Desktop/University of Nebraska/' % Add in file path where the figures will save here


Stats = readtable('AllPlayerStats.xlsx'); % Loads the data
colnames = Stats.Properties.VariableNames; % Gets the columns names
nonlinear = colnames(3:14); % Nonlinear column names
box = colnames(17:40); % Box score column names
boxscores = Stats(:,17:40);

for i = 1:length(box)
    x = nonlinear{1} % Change this number depending on the variable that you want to plot on the x axis
    %j = 1:length(box)
    y = box{i}
    
    % R squared values
    tmp = corrcoef(Stats.(x), boxscores.(i));
    r2 = tmp^2; % Value that is displayed on graph
    
    % Plot the graphs
    figure;
    plot(Stats.(x), boxscores.(i), '.', 'MarkerSize', 12)
    l1 = lsline % Add regression line
    l1.LineWidth = 3
    xlabel(x); ylabel(y) % Add axis labels based on the variables
    ax = gca;
    ax.FontSize = 13; % Change the Axis Label font sizes
    
    str=['r^2= ',num2str(r2(1,2))] % Converts value to a string
    T = text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str); % Finds the limits of the window
    set(T, 'fontsize', 14, 'verticalalignment', 'top', 'horizontalalignment', 'left'); % Places the R^2 value in the top left corner
    
    
    
    saveas(gcf, [filepath, NonlinearVariable, num2str(y)], 'png')
end
close all
