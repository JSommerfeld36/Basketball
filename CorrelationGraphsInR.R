
NonlinearVariable <- 'FullGameDFA vs ' # Change the variable in the title to reflect what you are plotting
filepath <- '' # Add in file path where the figures will save here


Stats <- read_xlsx('AllPlayerStats.xlsx'); # Loads the data
colnames <- colnames(Stats) #Stats.Properties.VariableNames; # Gets the columns names
nonlinear <- colnames(Stats[1,3:14]); # Nonlinear column names
box <- colnames(Stats[1,17:40]); # Box score column names
boxscores <- (Stats[,17:40]);

loop.vector<-(1:length(box))
for (i in loop.vector) { #dont forget to add back in the for loop
    x <- nonlinear[1] # Change this number depending on the variable that you want to plot on the x axis
    j = 1:length(box)
    y <- box[i]
    
    # R squared values
    tmp <- cor(Stats[x], boxscores[i], method = c());
    r2 <- tmp^2; # Value that is displayed on graph
    
    # Plot the graphs
    plot(Stats[x],boxscores[i], cex = 1.3,
    xlab=(x), ylab=(y), abline(lm(x ~ y)) )#'MarkerSize', 12
    
    str<-paste('r^2= ',(r2[1,2])) # Converts value to a string
    T <- text(min(get(gca, 'xlim')), max(get(gca, 'ylim')), str); # Finds the limits of the window
    set(T, 'fontsize', 14, 'verticalalignment', 'top', 'horizontalalignment', 'left'); # Places the R^2 value in the top left corner
}
    
    
    #save.image((filepath, NonlinearVariable, num2str(y)), 'png')

    