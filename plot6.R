library(dplyr)
library(data.table)
library(xlsx)
library(ggplot2)
library(stringr)

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
# Task 6
#################################

cars_la_baltimor <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

cars_la_baltimor_aggregated <- aggregate(Emissions ~ year + fips, cars_la_baltimor, sum)

#Changes names of fips in rows to labels of city
cars_la_baltimor_aggregated$fips[cars_la_baltimor_aggregated$fips=="24510"] <- "Baltimore, MD"
cars_la_baltimor_aggregated$fips[cars_la_baltimor_aggregated$fips=="06037"] <- "Los Angeles, CA"

ggplot(cars_la_baltimor_aggregated, aes(factor(year), Emissions)) +
facet_grid(. ~ fips) +
geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression("PM Emissions")) +
  ggtitle('Car Emissions in Baltimore vs LA for period  1999-2008') +
  theme_economist() + scale_colour_economist()
