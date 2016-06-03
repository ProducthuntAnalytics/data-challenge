# Import data from CSV
#rawCSV <- read.csv("./data/userData.csv",
#                    sep = ";",
#                   row.names = NULL)

# Pull out the desired columns (created_at and vote_count)
postCount <- as.numeric(rawCSV$posts_count)
followingCount <- as.numeric(rawCSV$followings_count)


pdf("./graphs/posts_vs_following.pdf")

# Create a plot using these 2 columns
plot(postCount, followingCount,
 xlab = "The number of posts", ylab = "The number of followers")
 # main = "Does following more people yield more followers?")

# Output to file (days_vs_votes_bar_graph.png)
dev.off()
