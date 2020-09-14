


library(readxl)
NBA_Stats <- read_excel("~/Desktop/Basketball/NBA_2019-2020_Stats.xlsx")
Stats <- read_excel("~/Downloads/AllPlayerStats (3).xlsx")

filepath <- '/Users/joelsommerfeld/Desktop/University of Nebraska/Lab Tech/' # Add in file path where the figures will save here
name = 'NBA Stats vs Our Stats'

k = paste(filepath, name, sep = "") # Combines the filepath and Nonlinearvariable name into a string
pdf(paste(k, ".pdf", sep = "")) # Creates a PDF using the above string


# Off Reb vs FG Made
regline = lm(NBA_Stats$FGM ~ NBA_Stats$OREB, data = NBA_Stats)
plot(NBA_Stats$OREB, NBA_Stats$FGM)
abline(regline)

reg = lm(Stats$FG ~ Stats$`OFF REB`, data = Stats)
plot(Stats$`OFF REB`, Stats$FG)
abline(reg)


# Off Reb vs Assists
regline1 = lm(NBA_Stats$AST ~ NBA_Stats$OREB, data = NBA_Stats)
plot(NBA_Stats$OREB, NBA_Stats$AST)
abline(regline1)

reg1 = lm(Stats$AST ~ Stats$`OFF REB`, data = Stats)
plot(Stats$`OFF REB`, Stats$AST)
abline(reg1)


# Turn overs vs Assists
regline2 = lm(NBA_Stats$AST ~ NBA_Stats$TOV, data = NBA_Stats)
plot(NBA_Stats$TOV, NBA_Stats$AST)
abline(regline2)

reg2 = lm(Stats$AST ~ Stats$TO, data = Stats)
plot(Stats$TO, Stats$AST)
abline(reg2)

# 3pt % vs 3pt Attempts
regline3 = lm(NBA_Stats$`3PA` ~ NBA_Stats$`3P%`, data = NBA_Stats)
plot(NBA_Stats$`3P%`, NBA_Stats$`3PA`)
abline(regline3)

reg3 = lm(Stats$`3PTA` ~ Stats$`3PT PERC`, data = Stats)
plot(Stats$`3PT PERC`, Stats$`3PTA`)
abline(reg3)

# FT % vs FT Attempts
regline4 = lm(NBA_Stats$FTA ~ NBA_Stats$`FT%`, data = NBA_Stats)
plot(NBA_Stats$`FT%`, NBA_Stats$FTA)
abline(regline4)

reg4 = lm(Stats$FTA ~ Stats$`FT PERC`, data = Stats)
plot(Stats$`FT PERC`, Stats$FTA)
abline(reg4)

# FG Made vs FG Attempted
regline5 = lm(NBA_Stats$FGA ~ NBA_Stats$FGM, data = NBA_Stats)
plot(NBA_Stats$FGM, NBA_Stats$FGA)
abline(regline5)

reg5 = lm(Stats$FGA ~ Stats$FG, data = Stats)
plot(Stats$FG, Stats$FGA)
abline(reg5)

dev.off()


