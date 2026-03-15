library(bibliometrix)

D <- readRDS("data/clean_dataset.rds")

tiff("figures/thematic_map.tiff",
     width = 3000,
     height = 2000,
     res = 600)

thematicMap(
  D,
  field = "DE",
  minfreq = 8,
  stemming = FALSE
)

dev.off()
