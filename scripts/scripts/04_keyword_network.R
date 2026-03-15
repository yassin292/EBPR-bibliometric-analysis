library(bibliometrix)

D <- readRDS("data/clean_dataset.rds")

NetMatrix <- biblioNetwork(
  D,
  analysis = "co-occurrences",
  network = "keywords",
  sep = ";"
)

tiff("figures/keyword_network.tiff",
     width = 3000,
     height = 2000,
     res = 600)

networkPlot(
  NetMatrix,
  n = 30,
  type = "fruchterman",
  size = TRUE,
  labelsize = 0.7
)

dev.off()
