library(bibliometrix)
library(igraph)
library(ggraph)
library(tidygraph)

D <- readRDS("data/clean_dataset.rds")

D <- metaTagExtraction(D, Field = "AU_CO", sep=";")

NetMatrix_country <- biblioNetwork(
  D,
  analysis = "collaboration",
  network = "countries",
  sep=";"
)

g <- graph_from_adjacency_matrix(
  NetMatrix_country,
  mode="undirected",
  weighted=TRUE,
  diag=FALSE
)

g <- delete_edges(g, E(g)[weight < 10])
g <- delete_vertices(g, degree(g)==0)

g_tbl <- as_tbl_graph(g)

tiff("figures/country_collaboration.tiff",
     width=4000,
     height=3000,
     res=600)

ggraph(g_tbl, layout="fr", niter=6000) +
  geom_edge_fan(aes(width=weight), alpha=0.4, colour="grey50") +
  geom_node_point(aes(size=centrality_degree(),
                      color=centrality_degree())) +
  geom_node_text(aes(label=name),
                 repel=TRUE,
                 size=4.5) +
  scale_color_gradient(low="#74a9cf", high="#08306b") +
  scale_size(range=c(3,7), guide="none") +
  theme_void()

dev.off()
