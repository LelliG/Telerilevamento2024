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


#Creation of dataset. Building dataframe
Class <- c('Forest', 'Human')
y1992 <- c(83,17)
y2006 <- c(45, 55)
tabout <- data.frame(Class, y1992, y2006)
View(tabout)

#Graph with ggplot2
#1992
p1 <- ggplot(tabout, aes(x=Class, y=y1992, color=Class)) + geom_bar(stat='identity', fill='grey')
#2006
p2 <- ggplot(tabout, aes(x=Class, y=y2006, color=Class)) + geom_bar(stat='identity', fill='grey')

#Join the 2 graphs
#install.packages('patchwork')
library('patchwork')
p1+p2
#axes are have different ranges
#1992
p1 <- ggplot(tabout, aes(x=Class, y=y1992, color=Class)) + geom_bar(stat='identity', fill='grey')+ylim(c(0,100))
#2006
p2 <- ggplot(tabout, aes(x=Class, y=y2006, color=Class)) + geom_bar(stat='identity', fill='grey')+ylim(c(0,100))
p1+p2
