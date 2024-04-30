library(imageRy)
library(terra)
library(viridis)
library(raster)
im.list()
sent <- im.import("sentinel.png")
im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)#prateria verde fluo. Acqua assrobe infrarosso sempre nera

#finestra mobile. dimensione da definire, ci mostra la variabilità della nostra immagine.
#variability
nir<- sent[[1]]
plot(nir)
cl<-colorRampPalette(c("red", "orange", "yellow"))(100)
plot(nir, col=cl)
#calcolo dev st in finestrina 3x3.d mw of 3 pixels
sd3 <- focal(nir, matrix(1/9,3,3), fun=sd)
##usiamo viridis
viridisc <- colorRampPalette(viridis(7))(100)
plot(sd3, col=viridisc)#zone a nordest variazione alta geomorfologiche, artefatti e contorni neve. crepacci.
#usiamoplasma
plasma <- colorRampPalette(plasma(7))(256)
plot(sd3, col=plasma)

#calculate the sd mw of 7 pixels
sd7 <- focal(nir, matrix(1/49,7,7), fun=sd)
viridisc <- colorRampPalette(viridis(7))(100)
plot(sd7, col=viridisc)

#calculate the sd mw of 13 pixels. Aumenta i blocchi, e si crea effetto sfocato.
sd13 <- focal(nir, matrix(1/169,13,13), fun=sd)
viridisc <- colorRampPalette(viridis(7))(100)
plot(sd13, col=viridisc)


sdstack <- c(sd3,sd7,sd13)
plot(sdstack, col=viridisc)
