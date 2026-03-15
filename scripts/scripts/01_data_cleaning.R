library(bibliometrix)
library(tidyverse)

# Import Scopus data
D <- convert2df(
  "data/scopus_export.csv",
  dbsource = "scopus",
  format = "csv"
)

# Save dataset
saveRDS(D, "data/raw_dataset.rds")

# Basic bibliometric statistics
results <- biblioAnalysis(D, sep = ";")
summary(results)
