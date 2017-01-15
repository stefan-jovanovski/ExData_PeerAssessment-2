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

########################
# Task 3 
########################

ggplot(temp, aes(x = factor(year), fill = Emissions)) +
  geom_bar() +
  facet_wrap(~ type) +
  xlab("Emission") +
  ylab("Year") +
  labs(fill = "Emissions")  +
  ggtitle("Emissions in Baltimore based on type") +
  scale_y_continuous(labels = scales::percent)
