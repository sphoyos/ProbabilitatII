
#------------------------------------------
# Proceso de  Poisson : número de casos de urgència
#------------------------------------------

set.seed(1234)

# Intensitat (pacients per hora)
lambda <- 3

# Temps màxim (hores)
Tmax <- 8

# Nombre total d'arribades
N <- rpois(1, lambda * Tmax)

# Instants d'arribada
arribades <- sort(runif(N, 0, Tmax))

# Trajectòria del procés
temps <- c(0, arribades, Tmax)
pacients <- c(0, seq_len(N), N)

plot(temps, pacients,
     type = "s",
     lwd = 2,
     col = "steelblue",
     xlab = "Temps (hores)",
     ylab = expression(X(t)),
     main = "Arribada de pacients a urgències")

grid(col = "grey85", lty = 3)
