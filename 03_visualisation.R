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

# Vegetazione assorbe lunghezza blu per fotosintesi, ma il viola è sicuramente anche vegetazione(bassa riflettanza)
clch <- colorRampPalette(c("magenta","cyan4","cyan","chartreuse"))(100)
plot(b2, col=clch)

#importing additional band
#b3 560 nm --> verde
b3<-im.import("sentinel.dolomites.b3.tif")
plot(b3, col=clch)

#b4 --->rosso
b4<-im.import("sentinel.dolomites.b4.tif")
plot(b4, col=clch)

#b8 --->rosso
b8<-im.import("sentinel.dolomites.b8.tif")
plot(b8, col=clch)
