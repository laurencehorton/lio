# Purpose
# Checking licence information in LIO metadata records.
# Works for an individual record approach, not for batch searching.

# Load packages
library(xml2)
library(stringr)
library(RCurl)
library(httr)
library(gsheet)

# Get spreadsheet ---------------------------------------------------------
# Imports spreadsheet from googledocs.
lio <- "https://docs.google.com/spreadsheets/d/1bNQl3RvWezcLP6Tf4WEkdDTSAHM1J2CxVYV4ZNbxcrE/edit#gid=1658201163"
spreadsheet <- gsheet2tbl(lio)
as.data.frame(spreadsheet)

# -------------------------------------------------------------------------
# LIO id string [row, column]
id <- spreadsheet[2,3]

# Adds an arcgis prefix to the url
arcgis <- "https://www.arcgis.com/sharing/rest/content/items/"
arcgis2 <- paste(arcgis, id, sep = "")

# Adds suffix for converting xml page into iso19115
metadata <- "/info/metadata/metadata.xml?format=iso19115"
xmlurl <- paste(arcgis2, metadata, sep = "")

# Check the URL  is valid TRUE/FALSE. if False then it prints the value.
x <- url.exists(xmlurl)
if(x == FALSE){print(xmlurl)}

# Reads into RStudio
xml <- read_xml(xmlurl)

# Converts to list
xml <- as_list(xml)

# Extracts licence info from XML
xml[["MD_Metadata"]][["identificationInfo"]][["MD_DataIdentification"]][["credit"]]

# Extracts abstract info from XML
xml[["MD_Metadata"]][["identificationInfo"]][["MD_DataIdentification"]][["abstract"]][["CharacterString"]]

# Citations----
citation()
citation(xml2)
citation(stringr)
citation(RCurl)
citation(httr)
citation(gsheet)
sessionInfo()

# Clear -------------------------------------------------------------------
# Removes enviroment and clears console
rm(arcgis,arcgis2,id,metadata,x,xmlurl,xml)
cat("\014")

