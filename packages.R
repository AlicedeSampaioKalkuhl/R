# Packages in use
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
  BiocManager::install(version = "3.11")
install.packages("deSolve")
install.packages("reshape2")
install.packages("scales")
install.packages("tidyverse")