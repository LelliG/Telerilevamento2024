library(imageRy)
library(terra)

im.list()
#importing Data
EN01<- im.import('EN_01.png')
EN03<- im.import('EN_03.png')
EN13<- im.import('EN_13.png')#covid situation

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)
#cambiamento piu forte, abbassamento piu sentito. #classificazione con valori continui. RANGE 8bit
difEN= EN01[[1]]-EN13[[1]]
cl<- colorRampPalette(c('blue', 'white', 'red')) (100)
dev.off()
plot(difEN, col=cl)


#scioglimento ghiacci in Groenlandia. Ice melt in Greenland.
#proxy, useremo una variabile più semplice. Temperature per lo scioglimento.Land Surface Temperature(temperatura del suolo) global scale
im.list()
g2000<-im.import('greenland.2000.tif')
clg<-colorRampPalette(c('black', 'blue', 'white', 'red'))(100)
plot(g2000, col=clg)


g2005<-im.import('greenland.2005.tif')
g2010<-im.import('greenland.2010.tif')
g2015<-im.import('greenland.2015.tif')

#plot. parte nera ovvero piu fredda meno estesa.
dev.off()
par(mfrow=c(1,2))
clg<-colorRampPalette(c('black', 'blue', 'white', 'red'))(100)
plot(g2000, col=clg)
plot(g2015, col=clg)

dev.off()
par(mfrow=c(2,2))
clg<-colorRampPalette(c('black', 'blue', 'white', 'red'))(100)
plot(g2000, col=clg)
plot(g2005, col=clg)
plot(g2010, col=clg)
plot(g2015, col=clg)

##plot anche stack
greenland <- c(g2000, g2005, g2010, g2015)
plot(greenland, col=clg)

#differenza fra 2000e 2015. zona rossa aumento temperatura (tbassa-talta=negativo)
dev.off()
difg= greenland[[1]] - greenland[[4]]
clgreen<- colorRampPalette(c('red', 'white', 'blue')) (100)
plot(difg, col=clgreen)
#posso usare plotRGB come strumento di confronto.
im.plotRGB(greenland, 1,2,4) #g2000 on red, g2005 on green, g2015 on blue. Parti piu scura, piu calda nel 2015(BLU)
