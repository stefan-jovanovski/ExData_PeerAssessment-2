library(dplyr)
library(data.table)
library(xlsx)
library(ggplot2)
library(stringr)

#Install ggthemes

install.packages('ggthemes', dependencies = TRUE)
library(ggthemes)


#################################
# Download and load data
#################################
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./data_for_peer_assessment.zip")

#Unzip data manually

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#################################
# Task 5
#################################

cars <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

cars_baltimore_aggregated <- aggregate(Emissions ~ year, cars, sum)

ggplot(cars_baltimore_aggregated, aes(factor(year), Emissions)) +
geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("PM 2.5 Emissions")) +
  ggtitle('Emissions from motor vehicles wihtin Baltimore from 1999 to 2008') +
  theme_economist() + scale_colour_economist()

#Export png at 1000 width

