


# Set the path and filter the directory for .csv files of area to load
path = "R:/Team Members/Sommerfeld Joel/Basketball Collaboration/Basketball Games/AreaTS/"
setwd(path)
filenames = list.files(pattern = '*.csv$',full.names = TRUE)


output_path = "C:/Users/jsommerfeld/Desktop/RQA/" # Add in file path where the figures will save here
name = "Full Game RQA Plots"


row_name = NULL # Used to create the strings for use in naming the columns
x = NULL # Variable for RQA to be stored as

# Blank variables for all variables calculated by RQA
rr = NULL
Det = NULL
div = NULL
nrline = NULL
ratio = NULL
maxline = NULL
meanline = NULL
lam = NULL
tt = NULL
vmax = NULL
entropy = NULL
rentropy = NULL

# Save a pdf
k = paste(output_path, name, sep = "") # Combines the output file path and file name into a string
pdf(paste(k, ".pdf", sep = "")) # Creates a PDF using the above string
  
for (i in 1:length(filenames)){
  # Read in the .csv files
  area = read.csv(filenames[i], header = TRUE)
  game_area = area$full_game
  
  # Removes all the unnecessary characters from the string for column rows
  fname = strsplit(filenames[i], '.csv')[[1]][1]
  row_name[i] = strsplit(filenames[i], '.csv')[[1]][1]
  row_name[i] = gsub("./", "", fname)
  
  # Sanity check that all files are being looped through
  print(i)

  ############ Perform all calculations below here ##############
  
  # RQA Calculation
  x = rqapp::rqa(game_area, game_area, 1,1,0,1,2,2,0,.0001,0,1)
  # Assign calculations to individual variables
  rr[i] = x$rqa$rr
  Det[i] = x$rqa$det
  div[i] = x$rqa$div
  nrline[i] = x$rqa$nrline
  ratio[i] = x$rqa$ratio
  maxline[i] = x$rqa$maxline
  meanline[i] = x$rqa$meanline
  lam[i] = x$rqa$lam
  tt[i] = x$rqa$tt
  vmax[i] = x$rqa$vmax
  entropy[i] = x$rqa$entropy
  rentropy[i] = x$rqa$rentropy
  
  # Create the RQA plots with the game and team as a subtitle 
  rqapp::recurrence_plot(x$rp)
  par(adj = 1)
  title(sub = row_name[i])
  
  
}
dev.off() 
results = data.frame('filename' = row_name, 'rr' = rr, 'DET' = Det, 'div' = div, 'nrline' = nrline, 'ratio' = ratio,
                     'maxline' = maxline, 'meanline' = meanline, 'lam' = lam, 'tt' = tt, 'vmax' = vmax, 
                     'Entropy' = entropy, 'rentropy' = rentropy)

write.csv(results, "C:/Users/jsommerfeld/Desktop/RQA/RQA_analysis.csv")


