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


#scioglimento ghiacci in Groenlandia
