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
im.plotRGB(m1992, 2, 1, 3)#1992 on Green
im.plotRGB(m1992, 2,3,1)#1992 nir on blue

im.plotRGB(m2006, r=1, g=2, b=3) #12006nir on red
im.plotRGB(m2006, 2, 1, 3)#2006 on Green
im.plotRGB(m2006, 2,3,1)#2006 nir on blue
