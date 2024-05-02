library(imageRy)
library(terra)
library(viridis)

im.list()
b2<-im.import("sentinel.dolomites.b2.tif") #blue
b3<-im.import("sentinel.dolomites.b3.tif") #green
b4<-im.import("sentinel.dolomites.b4.tif") #red
b8<-im.import("sentinel.dolomites.b8.tif") #nir
sentdo <-c(b2,b3,b4,b8)
im.plotRGB(sentdo, r=4, g=3, b=2) #veg rossa perche banda 4 nir e mostra la veg rossa, montata nella componente red rgb
im.plotRGB(sentdo, r=3, g=4, b=2)
#correlazione tra le bande
pairs(sentdo)

pcimage <- im.pca(sentdo)
#4 comp pricipali, 3 plotatte. Percentule variabilita bisogna sommare oggetti.Numeri variano si prende un campione per fare analisi.
tot=sum(1563.09974,  580.42839,   52.53325,   29.22522)
#variabilita della prrima componente
perc_1=1563.09974/tot*100
perc_2=580.42839/tot*100
perc_3=52.53325/tot*100
perc_4=29.22522/tot*100

vir <- colorRampPalette(viridis(7))(100)
plot(pcimage, col=vir)
