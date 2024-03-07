#First R script

#R as calculator
A <- 6 * 7
B <- 5 * 8
C <- A + B

#Arrays
flowers <- c(3, 6, 9, 12, 15, 18)

bees <- c(10, 16, 25, 42, 61, 73)

plot(flowers, bees, pch=16,  col='blue', cex=2, xlab='Flowers', ylab='Bees') #(X,Y,Simbolo, Colore, Dimensione, LabelX,labelY)

#Examples

#Symbol Dimensions
plot(flowers, bees, pch=16, cex=2) #x2
plot(flowers, bees, pch=16, cex=.5) #x0.5

#Colors
plot(flowers, bees, pch=16, cex=.5, col='chocolate1') 
