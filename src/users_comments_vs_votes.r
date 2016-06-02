# Import data from CSV
rawCSV <- read.csv("data/userData.csv",
                   sep = ";",
                   row.names = NULL)

# Pull out the desired columns (created_at and vote_count)
votesCount <- as.numeric(rawCSV$votes_count)
commentsCount <- as.numeric(rawCSV$comments_count)


png("./graphs/users_comments_vs_votes.png")

# Create a plot using these 2 columns
plot(commentsCount, votesCount,
 xlab = "The number of comments", ylab = "The number of votes")
 # main = "Do people who leave more comments also give more votes votes?")

# Output to file (days_vs_votes_bar_graph.png)
dev.copy(png, "./graphs/users_comments_vs_votes.png")
dev.off()
