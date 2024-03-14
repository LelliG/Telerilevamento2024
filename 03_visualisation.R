library(terra)
library(imageRy)

#List of data avialable in imageRy, ogni funzione inizia con im.
im.list()

#importing data mato 2006 https://earthobservatory.nasa.gov
mato <- im.import("matogrosso_ast_2006209_lrg.jpg")

#plotting the data
plot(mato)
#caricamento file dolomiti unica banda, la b2(lunghezza d'onda del blu) Es. Acqua 
b2<-im.import("sentinel.dolomites.b2.tif")
#cambiare scala colori
cl <- colorRampPalette(c("black","grey","light grey"))(3)
plot(b2)
