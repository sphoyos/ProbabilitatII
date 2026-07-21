

set.seed(1234)

# Temps (minuts)
n <- 300
temps <- seq(0, 10, length.out = n)

# Tendència fisiològica del VO2
tendencia <- 25 + 2.5 * temps

# Component aleatori gaussià amb certa correlació temporal
soroll <- numeric(n)
soroll[1] <- rnorm(1, 0, 1)

for(i in 2:n){
  soroll[i] <- 0.95*soroll[i-1] + rnorm(1,0,0.4)
}

# Sèrie temporal simulada
VO2 <- tendencia + soroll

# Representació
plot(temps, VO2,
     type = "l",
     lwd = 2,
     col = "steelblue",
     xlab = "Temps (minuts)",
     ylab = expression(VO[2]~"(mL·kg"^{-1}~"·min"^{-1}*")"),
     main = "Evolució del consum d'oxigen durant una prova d'esforç")

lines(temps, tendencia,
      lwd = 2,
      col = "red",
      lty = 2)

legend("topleft",
       legend = c("VO2 observat", "Tendència"),
       col = c("steelblue","red"),
       lty = c(1,2),
       lwd = 2)

grid(col="grey85", lty=3)
