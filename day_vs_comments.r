# Import data from CSV
rawCSV <- read.csv("./UsefulVotesData.csv")

# Pull out the desired columns (day of week and vote count)
dayOfWeek <- as.character(rawCSV$day.of.week)
voteCount <- as.numeric(rawCSV$comments_count)

# Create vectors to be used for graphing
voteVector <- vector(mode = "numeric", length = 7)
dayVector <- c("S", "M", "T", "W", "TH", "F", "SA")

# Create a "data frame", used for graphing - I think
dataFrame <- data.frame(dayOfWeek, voteCount);

# Aggregate the number of votes per day of week
for (rowNum in 1 : nrow(rawCSV [6])) {
  dayString <- dataFrame$dayOfWeek [rowNum]
  switch(as.character(dayString),
    "Sunday" = {
      voteVector [1] <- voteVector [1] + dataFrame$voteCount [rowNum]
    },
    "Monday" = {
      voteVector [2] <- voteVector [2] + dataFrame$voteCount [rowNum]
    },
    "Tuesday" = {
      voteVector [3] <- voteVector [3] + dataFrame$voteCount [rowNum]
    },
    "Wednesday" = {
      voteVector [4] <- voteVector [4] + dataFrame$voteCount [rowNum]
    },
    "Thursday" = {
      voteVector [5] <- voteVector [5] + dataFrame$voteCount [rowNum]
    },
    "Friday" = {
      voteVector [6] <- voteVector [6] + dataFrame$voteCount [rowNum]
    },
    "Saturday" = {
      voteVector [7] <- voteVector [7] + dataFrame$voteCount [rowNum]
    }
  )
}
print("All done, here's the output")
print(voteVector)

# Create a plot using these 2 columns
barplot(voteVector, names = dayVector,
 xlab = "Day of week of post", ylab = "Comment count",
 main = "Comparing a product's post day to the number of comments it earned")

# Output to file (days_vs_votes_bar_graph.png)
dev.copy(png, "./graphs/days_vs_comments_bar_graph.png")
dev.off()
