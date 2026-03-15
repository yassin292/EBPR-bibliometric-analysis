library(tidyverse)
library(ggplot2)

D <- readRDS("data/clean_dataset.rds")

annual_prod <- D %>%
  count(PY) %>%
  rename(Year = PY, Articles = n)

ggplot(annual_prod, aes(x = Year, y = Articles)) +
  geom_line(size = 1.2, color = "#1f78b4") +
  geom_point(size = 2.5, color = "#1f78b4") +
  scale_x_continuous(breaks = seq(2000, 2026, 2)) +
  labs(
    title = "Annual Scientific Production in EBPR Research",
    x = "Year",
    y = "Number of Publications"
  ) +
  theme_minimal()

ggsave(
  "figures/annual_production.tiff",
  width = 6,
  height = 4,
  dpi = 600
)
