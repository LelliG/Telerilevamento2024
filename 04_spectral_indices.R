library(terra)
library(imageRy)

#list of files
im.list()
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg" )
#bands
#band 1 = NIR
#band 2 = red
#band 3 = green
#plot
im.plotRGB(m1992, r=1, g=2, b=3)
#acqua non è nera come dovrebbe, sedimento e vegetazione
#nir on green
im.plotRGB(m1992, 2, 1, 3)
#nir on blue----> nterazione umana
im.plotRGB(m1992, 2,3,1)

#2006
m2006<- im.import("matogrosso_ast_2006209_lrg.jpg")
par(mfrow=c(1,2))
im.plotRGB(m1992, 1,2,3)
im.plotRGB(m2006, 1,2,3)

dev.off()
par(mfrow=c(1,2))
im.plotRGB(m1992, 2,3,1)
im.plotRGB(m2006, 2,3,1)
dev.off

par(mfrow=c(2,3))
im.plotRGB(m1992, r=1, g=2, b=3) #1992 nir on red
im.plotRGB(m1992, 2, 1, 3)#1992 nir on Green
im.plotRGB(m1992, 2,3,1)#1992 nir on blue

im.plotRGB(m2006, r=1, g=2, b=3) #12006nir on red
im.plotRGB(m2006, 2, 1, 3)#2006 nir on Green
im.plotRGB(m2006, 2,3,1)#2006 nir on blue

#perche rifelttanza arriva fino 255 e non va fra zero e 1? presentazione.
#ncelle*3bande. Immagini 8bit- 2 all ottava quindi 256 bit----scala fra 0 e 255.
#esa 16bit, per ciu 65536 informazioni.
#risoluzione spaziale, risoluzione spettrale(bande) e risoluzione

library('terra')
library('imageRy')

im.list()

m1992<- im.import("matogrosso_l5_1992219_lrg.jpg")
#DVI 255-0=255 valore max....valore min -255. Indice fortemente influenzato da risoluzione radiometrica.NIR-RED

dvi1992=m1992[[1]] - m1992[[2]]#primo elemento-secondo elemento
#dvi1992=m1992$matogrosso_l5_1992219_lrg_1-m1992$matogrosso_l5_1992219_lrg_2
cl<- colorRampPalette(c("darkblue","yellow", "red", "black"))(100)
plot(dvi1992, col=cl)

m2006<- im.import("matogrosso_ast_2006209_lrg.jpg")
#DVI 255-0=255 valore max....valore min -255. Indice fortemente influenzato da risoluzione radiometrica.

dvi2006=m2006[[1]] - m2006[[2]]#primo elemento-secondo elemento
#dvi2006=m2006$matogrosso_l5_2006219_lrg_1-m2006$matogrosso_l5_2006219_lrg_2
cl<- colorRampPalette(c("darkblue","yellow", "red", "black"))(100)
plot(dvi2006, col=cl)
#giallo mostra assenza di foresta

#exercise plot the dvi1992 beside the 2006

par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
