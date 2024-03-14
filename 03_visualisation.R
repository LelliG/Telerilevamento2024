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
#cambiare scala colori (c(arraycolori))(numerosfumature)
clg <- colorRampPalette(c("black","grey","light grey"))(3)
plot(b2, col=clg)

#cambio scala colori
cl_cyan <- colorRampPalette(c("magenta","cyan4","cyan"))(100)
plot(b2, col=cl_cyan)

# Vegetazione assorbe lunghezza blu per fotosintesi
clch <- colorRampPalette(c("magenta","cyan4","cyan","chartreuse"))(100)
plot(b2, col=clch)
