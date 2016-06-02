# Import data from CSV
rawCSV <- read.csv("../DataWrangling/import/data/UsefulVotesData.csv")

# Pull out the desired columns (created_at and vote_count)
timeStamp <- as.character(rawCSV$created_at)
voteCount <- as.numeric(rawCSV$votes_count)

# Create vectors to be used for graphing
voteVector <- vector(mode = "numeric", length = 24)
hourVector <- vector(mode = "numeric", length = 24)

# Create a "data frame", used for graphing - I think
dataFrame <- data.frame(timeStamp, voteCount);

# Aggregate the number of votes per hour
for (rowNum in 1 : nrow(rawCSV [6])) {
  POSIXStamp = as.POSIXlt(dataFrame$timeStamp [rowNum])

  # R vectors are 1-based
  voteVector [POSIXStamp$hour + 1] <- voteVector [POSIXStamp$hour + 1] +
                                  dataFrame$voteCount [rowNum]
}

# Populate hour vector to be from 0 to 24
for (i in 0:23) {
  hourVector [i + 1] <- i
}

print("All done, here's the output")
print(voteVector)

# Create a plot using these 2 columns
barplot(voteVector, names = hourVector,
 xlab = "Hour of post (EDT?)", ylab = "Vote count",
 main = "Comparing a product's post hour to the number of votes it earned")

# Output to file (days_vs_votes_bar_graph.png)
dev.copy(png, "hour_vs_votes_bar_graph.png")
dev.off()
