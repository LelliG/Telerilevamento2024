#installing new packages in R
install.packages("terra") #argomento è il nome del pack, va nel Cran
library(terra)

# install.packages("devtools")
library(devtools)

# install the imageRy package from GitHub
devtools::install_github("ducciorocchini/imageRy")

library(imageRy)
