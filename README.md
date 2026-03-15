# EBPR Bibliometric Analysis
This repository contains the data, scripts, and figures used to perform a bibliometric analysis of research on **Enhanced Biological Phosphorus Removal (EBPR)** from **2000 to 2026**.

The analysis explores the evolution of EBPR research using bibliometric methods implemented in **R** with the **bibliometrix** package.


---

## Objectives

The aim of this analysis is to:

- Identify trends in EBPR scientific production.
- Explore the main research themes in the field.
- Detect emerging topics and thematic evolution.
- Analyze international collaboration networks.

---

## Data Source

The dataset was obtained from **Scopus** using a query related to EBPR and wastewater phosphorus removal.

The exported file was processed using the `bibliometrix` R package.

Because of database licensing restrictions, the raw bibliographic dataset may not be redistributed publicly.
The raw bibliographic dataset was exported from Scopus and may not be redistributed due to database licensing restrictions. The analysis scripts allow full reproducibility when the dataset is available.

---

## Repository Structure 
- **data/** – Raw and processed bibliographic datasets.
- **scripts/** – R scripts used to perform the bibliometric analysis.
- **figures/** – Figures generated from the analysis.
- **README.md** – Documentation explaining the repository and workflow.
## Methods

The bibliometric analysis was conducted in **R** using the following packages:

- bibliometrix
- tidyverse
- ggplot2
- igraph
- ggraph
- ggalluvial

Main analytical steps included:

1. Data import and cleaning
2. Keyword normalization
3. Annual scientific production analysis
4. Keyword co-occurrence network
5. Strategic thematic mapping
6. Thematic evolution analysis
7. International collaboration network analysis

---

## Key Results

The bibliometric analysis highlights:

- Rapid growth of EBPR research after 2018
- Increasing focus on microbial ecology and resource recovery
- Emerging technologies such as aerobic granular sludge
- Strong international collaboration centered around China, USA, and Australia

---

## Software

All analyses were performed using:
R version ≥ 4.2
bibliometrix package

---

## Citation

If you use this repository, please cite the associated study:888888888

---

## License

This project is released under the **MIT License**.
