# Purpose: Checking for open data that we don't have loaded in the GeoPortal.
# Use a subset of open data sets to see if they are in geoportal.
# Works only when logged into SP or on campus VPN

# Import search terms
searchterm <- read.csv("//Users/laurencehorton/desktop/lio-search.csv")

# Sets prefix and suffix for search URL-------------------------------------------------------------------------

prefix <- "http://geo2.scholarsportal.info/#r/search/_queries@="
suffix <- ";&fields@=;&sort=relevance&limit=entitled"

# Search term -------------------------------------------------------------

# Selects search term from spreadsheet [row,column]
search <- searchterm[106,2]

# removes spaces and replaces with '%20' for search URL
spaceremove <- gsub(" ", "%20", search, fixed = TRUE)

# Adds the search prefix to the URL.
prefixpaste<- paste(prefix, spaceremove, sep = "")

# Puts the URL search together
searchurl <- paste(prefixpaste, suffix, sep = "")

# Searches for the term using the URL and opens a web browser.
browseURL(searchurl)