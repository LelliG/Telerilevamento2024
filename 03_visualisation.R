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

#b8 --->infrarosso
b8<-im.import("sentinel.dolomites.b8.tif")
plot(b8, col=clch)

#Usiamo funzione par() per multiframe. par(mfrow==nriighe, mfcol=ncol). Questa funzione crea il grigliato, popolato in seguito dai 4 plot delle bande
par(mfrow=c(2,2))
plot(b2, col=clch)
plot(b3, col=clch)
plot(b4, col=clch)
plot(b8, col=clch)

#Exercise_Plot 4bands su 1 sola row

par(mfrow=c(1,4))
plot(b2, col=clch)
plot(b3, col=clch)
plot(b4, col=clch)
plot(b8, col=clch)

#procedura per impilare immagini, stack----> singola immagine che contiene singoli elementi. In questo modo si ottiene immagine satellitare(insieme di diverse bande)
stacksent<- c(b2,b3,b4,b8)
#plot immagine multi-spettrale
plot(stacksent, col=clch)
#cancella device grafico precedente, ovvero il par
dev.off()
#selezionare righe e colonne. [] per selezionare la colonna=attributo. con matrici si usa doppia []
#plot infrarosso
plot(stacksent[[4]], col=clch)


#schema RGB, red green Blue. Filtri combinati portano a tutti i potenziali colori.

#RGB PLOTTING
#4bande
#stacksent[[1]]= b2 = blue
#stacksent[[2]]= b3= green
#stacksent[[3]]= b4 = red
#stacksent[[4]]= b8 = nir (utile per identificare specie di piante)
#SI ASSOCIANO LE BANDE ai colori RGB, STANDARD 3,2,1
im.plotRGB(stacksent, 3, 2, 1)







