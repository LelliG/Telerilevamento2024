library('terra')
library('imageRy')
library('ggplot2')

#Quantify land cover variability

#import Sun and Mato
im.list()
m1992<- im.import("matogrosso_l5_1992219_lrg.jpg")
sun<- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#classify
sunc <- im.classify(sun, num_cluster=3)#numeri delle classi variano in base all'algoritmo.(1,2,3)

#classification on Mato in different eras
m2006 <-im.import("matogrosso_ast_2006209_lrg.jpg")

m1992c <- im.classify(m1992, num_cluster=2)
#class 1 = human
#class 2 = forest 
m2006c <- im.classify(m2006, num_cluster=2)
#class 1 = human
#class 2 = forest
