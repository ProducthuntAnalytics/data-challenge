# Import data from CSV
#rawCSV <- read.csv("./data/userData.csv",
#                    sep = ";",
#                   row.names = NULL)

# Pull out the desired columns (created_at and vote_count)
postCount <- as.numeric(rawCSV$posts_count)
voteCount <- as.numeric(rawCSV$votes_count)
commentCount <- as.numeric(rawCSV$comments_count)

# Define vars of interest
neverPosted <- 0
neverVoted <- 0
neverCommented <- 0

# Count num of people who have never posted, voted, or commented
for (rowNum in 1 : nrow(rawCSV [6])) {
  if (postCount [rowNum] == 0) {
    neverPosted <- neverPosted + 1
  }
  if (voteCount [rowNum] == 0) {
    neverVoted <- neverVoted + 1
  }
  if (commentCount [rowNum] == 0) {
    neverCommented <- neverCommented + 1
  }
}

pdf("./graphs/never_have_i_ever.pdf")

# Create a plot using these 2 columns
barplot(c(neverPosted, neverVoted, neverCommented),
        names = c("Make a post", "Vote on a post", "Make a comment"),
        xlab = "Activity",
        ylab = "Number of people who have never done it")
 # main = "Does following more people yield more followers?")

# Output to file (days_vs_votes_bar_graph.png)
dev.off()
