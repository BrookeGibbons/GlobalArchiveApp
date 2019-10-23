# Clear memory ----
rm(list=ls())

# Load packages ----
#library(devtools)
#install_github("UWAMEGFisheries/GlobalArchive",force = TRUE) #to check for updates

library(shiny)
library(shinythemes)
library(readr)
library(tidyr)
library(ggplot2)
library(scales)
library(ggmap)
library(grid)
library(leaflet)
library(stringr)
library(scales)
library(rgdal)
library(dbplyr)
library(DBI)
library(RPostgres)
library(config)
library(shinycssloaders)
library(dplyr)
library(rsconnect)
library(curl)
library(shinyAce)
library(fst)
library(DT)
library(googlesheets)
library(forcats)
library(leaflet.minicharts)
library(GlobalArchive)

# Increase max size of file uploads ----
options(shiny.maxRequestSize=1000*1024^2)

# Theme for plotting ----
Theme1 <-
  theme( # use theme_get() to see available options
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    legend.background = element_blank(),
    legend.key = element_blank(), # switch off the rectangle around symbols in the legend
    legend.text = element_text(size=15),
    legend.title = element_blank(),
    legend.position = "top",
    text=element_text(size=14),
    strip.text.y = element_text(size = 14,angle = 0),
    axis.title.x=element_text(vjust=0.3, size=15),
    axis.title.y=element_text(vjust=0.6, angle=90, size=15),
    axis.text.y=element_text(size=14),
    axis.line.x=element_line(colour="black", size=0.5,linetype='solid'),
    axis.line.y=element_line(colour="black", size=0.5,linetype='solid'),
    strip.background = element_blank(),
    plot.title = element_text(color="black", size=14, face="bold.italic"))


# functions for summarising data on plots ----
se <- function(x) sd(x) / sqrt(length(x))
se.min <- function(x) (mean(x)) - se(x)
se.max <- function(x) (mean(x)) + se(x)

# Colour palette for habitat plot ----
colors <- c("#d94c45","#78807a","#bd6539","#d67cc9","#d99445","#4eb570","#faef52")

#4eb570 green
#d94c45 red
#bd6539 brown
#d67cc9 pink
#78807a grey
#faef52 yellow
#d99445 orange

# Run app ----
#runApp()

# Deploy to shiny app website ----
# Set up account info to connect to shinyapps
# library(rsconnect)
# rsconnect::setAccountInfo(name='brookegibbons',
#                           token='23916448A9BBBA3709D39E858B6288BE',
#                           secret='JIKZ2b9L3uhCMZi4KYXM7D9xFIBROL72DDgyQH8y') # connect to shinyapps
# deployApp()