## ---@@@@@@@@@@@@@@@@--- ##
## ---ProjectNPSpecies--- ##
## ---@@@@@@@@@@@@@@@@--- ## 


# Original Scrape Script | Do Not Run # 
# This whole project is inspired by @fishingarrett the 'yoink guy' on YT. 


# ********************************************  #
# To properly cite NPSpecies use the following: 
# NPSpecies - The National Park Service biodiversity database.
# https://irma.nps.gov/npspecies/. 
# Accessed September 2nd, 2024.
# ********************************************* # 

# harvesting park names -----------------------------------------------
# the park names
# using this url: https://irma.nps.gov/NPSpecies/Park
# yoink_parks <- \(){
# parks <- "https://irma.nps.gov/NPSpecies/Lookup/GetAllUnits?_dc=1725242288027"
#   parks_raw <- parks |> rvest::read_html() |> rvest::html_text()
#     parks_ls <- parks_raw |> jsonlite::parse_json()
#       parks_df <- do.call(rbind, parks_ls) |> as.data.frame()
#  return(parks_df)
# }
###### parks_df <- yoink_parks()

# harvesting park species ---------------------------------------------
# GUI for Data Queries ----
# https://irma.nps.gov/NPSpecies/Search/SpeciesList
# been scouting headless or req methods 
# network pane shows a post request made with a payload 
# URL on network pane with payload info

# yoink_species <- \(park){
# url <- "https://irma.nps.gov/NPSpecies/Search/GetSpeciesListFullListWithDetailsResults"
# 
# # parameters for the POST request 
# params <- list(
#   UnitCode = park,  # park id
#   SearchLevel = 3,
#   IncludeSynonyms = "false",
#   IncludeParkRestrictedRecords = "false",
#   page = 1,
#   Start = 0,
#   Limit = 99999,   
#   Sort = '[{"property":"UnitCode","direction":"ASC"},{"property":"NPSpeciesCategorySortOrder","direction":"ASC"},{"property":"Order","direction":"ASC"},{"property":"Family","direction":"ASC"},{"property":"SciName","direction":"ASC"}]'
# )
# 
# # POST request
# response <- httr::POST(url, body = params, encode = "json")
#   content <- httr::content(response, "text", encoding = "UTF-8")
#     data <- jsonlite::fromJSON(content)
#       species_df <- data$Results
#   
#   return(species_df)
# }
# 
###### species_df <- purrr::map_df(parks_df$UnitCode, yoink_species)

# species data cleaning ----
# species formatted to the website xl download 
# species_xl_format <- 
# species_df |> 
#   dplyr::select(
#                 ParkCode = "UnitCode",
#                 ParkName = "UnitName",
#                 CategoryName,
#                 CategorySort = "NPSpeciesCategorySortOrder",
#                 Order,
#                 Family, 
#                 TaxonCode, 
#                 TSN = "ExternalCode", 
#                 TaxonRecordStatus = "LifecycleState",
#                 SciName,
#                 CommonNames,
#                 Synonyms,
#                 ParkAccepted = "IsAccepted",
#                 Sensitive = "IsSensitive",
#                 RecordStatus,
#                 Occurrence,
#                 OccurrenceTags,
#                 Nativeness,
#                 NativenessTags,
#                 Abundance,
#                 NPSTags,
#                 ParkTags,
#                 References = "DataStoreReferencesCount",
#                 Observations = "ObservationsCount",
#                 Vouchers = "VouchersCount",
#                 ExternalLinks,
#                 TEStatus,
#                 StateStatus,
#                 OzoneSensitiveStatus,
#                 GRank,
#                 SRank
#               )
