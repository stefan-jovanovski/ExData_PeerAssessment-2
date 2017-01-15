library(dplyr)
library(data.table)
library(xlsx)
library(ggplot2)
library(stringr)

#################################
# Download and load data
#################################
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./data_for_peer_assessment.zip")

#Unzip data manually

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#################################
# Task 4
#################################

coal  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
coal_observations <- NEI[coal, ]

coal_emmissions <- aggregate(Emissions ~ year, coal_observations, sum)

ggplot(coal_emmissions, aes(factor(year), Emissions)) +
  geom_bar(stat="identity") + coord_flip() +
  xlab("Years") +
  ylab("Emissions") 
