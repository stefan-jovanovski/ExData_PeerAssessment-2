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
# Task 2. 
########################

temp <- filter(NEI, fips == "24510")
plot2 <- aggregate(Emissions ~ year, temp, sum)
barplot(plot2$Emissions, names.arg=plot2$year, col = "red", xlab="Years", ylab=expression('Emissions'),main=expression('PM 2.5 Emissions in Baltimore'))
