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
#the classifications are everytime different
m1992c <- im.classify(m1992, num_cluster=2)
#class 1 = human
#class 2 = forest 
m2006c <- im.classify(m2006, num_cluster=2)
#class 1 = human
#class 2 = forest



#Calculating frequencies 1996
f1992 <- freq(m1992c) #forest>>>>>>>>human
tot1992 <- ncell(m1992c)
prop1992 = f1992/ tot1992
perc1992 = prop1992*100#forest=83% human=17%

#Calculating frequencies 2006
f2006 <- freq(m2006c) #forest>>>>>>>>human
tot2006 <- ncell(m2006c)
prop2006 = f2006/ tot2006
perc2006 = prop2006*100#forest=45% human=55%
