library(tidyverse)
library(ggalluvial)

D <- readRDS("data/clean_dataset.rds")

# Create time slices
D$Slice <- cut(
  D$PY,
  breaks = c(1999,2009,2017,2026),
  labels = c("2000–2009","2010–2017","2018–2026")
)

keywords <- D %>%
  select(PY, Slice, DE) %>%
  separate_rows(DE, sep=";") %>%
  mutate(DE = trimws(DE)) %>%
  filter(DE != "")

kw_freq <- keywords %>%
  count(DE, sort=TRUE) %>%
  filter(n >= 30)

keywords_filtered <- keywords %>%
  filter(DE %in% kw_freq$DE)

theme_counts <- keywords_filtered %>%
  group_by(Slice, DE) %>%
  summarise(n = n(), .groups="drop")

tiff("figures/thematic_evolution.tiff",
     width=3600,
     height=2200,
     res=600)

ggplot(theme_counts,
       aes(x=Slice,
           stratum=DE,
           alluvium=DE,
           y=n,
           fill=DE)) +
  geom_flow(alpha=0.85) +
  geom_stratum(width=0.5) +
  theme_minimal() +
  theme(legend.position="none")

dev.off()
