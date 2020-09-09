
library(readxl)

NonlinearVariable <- 'FullGameDFA' # Change the variable in the title to reflect what you are plotting
filepath <- '' # Add in file path where the figures will save here


Stats <- read_xlsx('C:/Users/jsommerfeld/Desktop/AllPlayerStats.xlsx'); # Loads the data. Need to use a local path
colnames <- colnames(Stats) # Gets the columns names
nonlinear <- colnames(Stats[1,3:14]); # Nonlinear column names
box <- colnames(Stats[1,17:40]); # Box score column names
boxscores <- (Stats[,17:40]); # New data frame with just the box scores

k = paste(filepath, NonlinearVariable, sep = "") # Combines the filepath and Nonlinearvariable name into a string
pdf(paste(k, ".pdf", sep = "")) # Creates a PDF using the above string

loop.vector<-(1:length(box))
for (i in loop.vector) { # Don't forget to add back in the for loop
    x <- nonlinear[1] # Change this number depending on the variable that you want to plot on the x axis
    y <- box[i]
    
    # R squared values
    tmp <- cor(Stats[x], boxscores[i], method = c());
    r2 <- tmp^2; # Value that is displayed on graph
   
    
    pvar = data.frame(Stats[x], boxscores[i]) # Put x and y variable into a data frame for easy plotting
    regline = lm(pvar[,1] ~ pvar[,2], pvar) # Create a regression line to add to the plot
    plot(pvar, xlab=(x), ylab=(y)) # Create the plot specifying the X and Y axis labels
    abline(regline) # Add in the regression line
    
    
    str <-paste('r^2= ',(r2[1,1])) # Converts value to a string
    limits = par("usr")
    T <- text(0.825, 130, str); # Finds the limits of the window 
    #set(T, 'fontsize', 14)#,'verticalalignment', 'top', 'horizontalalignment', 'left'); # Places the R^2 value in the top left corner
  

    }
      dev.off() # Tells the PDF when to stop adding plots to it
    