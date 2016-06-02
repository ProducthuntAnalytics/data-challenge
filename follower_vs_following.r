# Import data from CSV
rawCSV <- read.csv("../DataWrangling/import/data/UserData.csv",
                   sep = ";",
                   row.names = NULL)

# Pull out the desired columns (created_at and vote_count)
followerCount <- as.numeric(rawCSV$followers_count)
followingCount <- as.numeric(rawCSV$followings_count)

# Create a plot using these 2 columns
plot(followingCount, followerCount,
 xlab = "The number of people followed", ylab = "The number of followers",
 main = "Does following more people yield more followers?")

# Output to file (days_vs_votes_bar_graph.png)
dev.copy(png, "follower_vs_following.png")
dev.off()
