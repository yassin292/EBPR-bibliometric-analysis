library(tidyverse)

D <- readRDS("data/raw_dataset.rds")

# Lowercase keywords
D$DE <- tolower(D$DE)

# Normalize important EBPR keywords
D$DE <- gsub("denitrifying phosphorus removal", "denitrification", D$DE)
D$DE <- gsub("\\bdenitrifying\\b", "denitrification", D$DE)

D$DE <- gsub("nutrient phosphorus removal",
             "biological nutrient removal", D$DE)

D$DE <- gsub("nitrogen phosphorus removal", "", D$DE)

D$DE <- gsub("accumulating organismss",
             "polyphosphate accumulating organisms", D$DE)

D$DE <- gsub("\\brecovery\\b", "phosphorus recovery", D$DE)

# Clean separators
D$DE <- gsub("\\s*;\\s*", ";", D$DE)
D$DE <- gsub(";+",";", D$DE)
D$DE <- gsub("^;|;$","", D$DE)

saveRDS(D, "data/clean_dataset.rds")
