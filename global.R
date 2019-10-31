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
library(extrafont)

# Increase max size of file uploads ----
options(shiny.maxRequestSize=1000*1024^2)

# Load font
# loadfonts(device="win")  
# font_import()
# fonts()   

# Theme for plotting ----
Theme1 <-
  theme( # use theme_get() to see available options
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    legend.background = element_blank(),
    legend.key = element_blank(), # switch off the rectangle around symbols in the legend
    legend.text = element_text(size=14),
    legend.title = element_blank(),
    legend.position = "right",
    strip.text.y = element_text(size = 14,angle = 0),
    axis.title.x=element_text(vjust=0.3, size=14),
    axis.title.y=element_text(angle=90, size=14), #vjust=0.6, 
    axis.text.y=element_text(size=12),
    axis.text.x=element_text(size=12),
    axis.line.x=element_line(colour="black", size=0.5,linetype='solid'),
    axis.line.y=element_line(colour="black", size=0.5,linetype='solid'),
    strip.background = element_blank(),
    plot.title = element_text(color="black", size=15, face="bold"),
    text=element_text(family="Times New Roman", size=14),
    panel.grid = element_blank(), 
    panel.border = element_blank(), 
    axis.line = element_line(colour = "black"))


# functions for summarising data on plots ----
se <- function(x) sd(x) / sqrt(length(x))
se.min <- function(x) (mean(x)) - se(x)
se.max <- function(x) (mean(x)) + se(x)

# Colour palette for habitat plot ----
colors <- c("#d94c45","#78807a","#bd6539","#d67cc9","#d99445","#4eb570","#faef52")

# token <- gs_auth(cache = FALSE)
# gd_token()
# saveRDS(token, file = "googlesheets_token.rds")



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
library(rsconnect)

# MY account
rsconnect::setAccountInfo(name='brookegibbons', token='23916448A9BBBA3709D39E858B6288BE', secret='JIKZ2b9L3uhCMZi4KYXM7D9xFIBROL72DDgyQH8y')

#rsconnect::setAccountInfo(name='globalarchive',
#                         token='6CEEEFEBB8A0CEB1997210A7E9B6B94A',
#                         secret='2SI4c31ff1LWL44+IPmT3zsl4IOps7wDY8uiRrNR')
deployApp()
