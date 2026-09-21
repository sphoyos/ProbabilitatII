set.seed(666666)

# Nombre de partides
n <- 20

# Capital inicial
x0 <- 10

# Trajectòria 1
mov1 <- sample(c(-1,1), n, replace = TRUE)
X1 <- c(x0, x0 + cumsum(mov1))

# Trajectòria 2
mov2 <- sample(c(-1,1), n, replace = TRUE)
X2 <- c(x0, x0 + cumsum(mov2))

temps <- 0:n

# Límits dels eixos
ylim <- range(c(X1, X2))



plot(temps, X1,
     type = "o",
     pch = 16,
     col = "black",
     lwd = 2,
     xaxt = "n",
     yaxt = "n",
     xlab = "t",
     ylab = expression(X[t]),
     ylim = c(min(c(X1,X2))-1,max(c(X1,X2))+1))
# Línea horizontal en el capital inicial
abline(h = 10, col = "red", lty = 2, lwd = 2)

axis(1, at = seq(0,20,5))
axis(2)
box()

lines(temps, X2,
      type = "o",
      pch = 16,
      col = "magenta",
      lwd = 2)
