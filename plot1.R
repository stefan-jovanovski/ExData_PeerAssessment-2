library(dplyr)
library(data.table)
library(xlsx)
library(ggplot2)
library(stringr)

#################################
# Part 1: Download and load data
#################################
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./data_for_peer_assessment.zip")

#Unzip data manually

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

########################
# Task 1. 
########################

#Review data

str(NEI)
str(SCC)

#Aggregate the total emission numbers per year
plot1 <- aggregate(Emissions ~ year, NEI, sum)

#Create barplot
barplot(plots_by_year$Emissions, names.arg=plots_by_year$year, col = "red", xlab="Years", ylab=expression('Emissions'),main=expression('PM 2.5 Emissions'))
