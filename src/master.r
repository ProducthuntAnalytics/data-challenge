# Import UsefulVotesData from CSV
rawCSV <- read.csv("data/UsefulVotesData.csv")
source("./src/day_vs_votes.r")
source("./src/day_vs_comments.r")
source("./src/hour_vs_comments.r")
source("./src/hour_vs_votes.r")
source("./src/heatmap.r")

# Import userData from CSV
rawCSV <- read.csv("./data/userData.csv",
                    sep = ";",
                   row.names = NULL)
source("./src/posts_vs_following.r")
source("./src/follower_vs_following.r")
source("./src/never_have_i_ever.r")
source("./src/users_comments_vs_votes.r")
