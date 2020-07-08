# Packages in use
install.packages("Rtools")
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
  BiocManager::install(version = "3.11")
install.packages("deSolve")
install.packages("mr.raps") #Zhao et al. 2019
install.packages("reshape2")
install.packages("scales")
install.packages("tidyverse")
install.packages("here")
install.packages("devtools")
devtools::install_github("revbayes/RevKnitr")
  writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
