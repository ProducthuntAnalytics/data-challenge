if (!require("RColorBrewer")) {
 install.packages("RColorBrewer", dependencies = TRUE)
 library(RColorBrewer)
}
if (!require("gplots")) {
   install.packages("gplots", dependencies = TRUE)
   library(gplots)
}

# Import data from CSV
rawCSV <- read.csv("data/UsefulVotesData.csv")

# Pull out the desired columns (day of week and vote count)
voteCount <- as.numeric(rawCSV$votes_count)
timeStamp <- as.character(rawCSV$created_at)

# Used for holding data
dayAndTimeList <- vector(length = 24 * 7)

# Create a "data frame", used for graphing - I think
dataFrame <- data.frame(timeStamp, voteCount);

# Aggregate a list such: [Sunday@0, Sunday@1, Sunday@2, etc.]
for (rowNum in 1 : nrow(rawCSV [6])) {
  POSIXStamp <- as.POSIXlt(dataFrame$timeStamp [rowNum])
  dayAndTimeList [(24 * (POSIXStamp$wday - 1)) + POSIXStamp$hour] <-
    dayAndTimeList [(24 * (POSIXStamp$wday - 1)) + POSIXStamp$hour] +
    dataFrame$voteCount [rowNum]
}


#print("All done, here's the output")
#print(dayAndTimeList)

# Create matrix and adjust columns
dataMatrix <- matrix(dayAndTimeList, 24, 7, byrow = T)
colnames(dataMatrix) <- c("Sunday", "Monday", "Tuesday", "Wednesday",
                          "Thursday", "Friday", "Saturday")

# Populate hour vector to be from 0 to 23
hourVector = vector(length = 24)
for (i in 0:23) {
  hourVector [i + 1] <- i
}
rownames(dataMatrix) <- hourVector

graphColors <- colorRampPalette(c("red", "yellow", "green"))(n = 400)

pdf("./graphs/heatmap.pdf")
daGraph <- heatmap.2(dataMatrix,
                     #main = "Correlating vote count with day and hour of post",
                     col  = graphColors,
                     trace = "none",
                     dendrogram = "none",
                     Rowv = "NA",
                     Colv = "NA")
dev.off()
