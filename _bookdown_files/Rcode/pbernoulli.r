#------------------------------------------
# Proceso de Bernoulli: compras de clientes
#------------------------------------------
# 
# set.seed(1234)
# 
# n <- 30          # Número de clientes
# p <- 0.65        # Probabilidad de compra
# 
# # Simulación del proceso
# Xt <- rbinom(n, size = 1, prob = p)
# 
# # Gráfico
# plot(1:n, Xt,
#      type = "o",
#      pch = 19,
#      lwd = 2,
#      col = "steelblue",
#      ylim = c(-0.1, 1.1),
#      xlab = "Client",
#      ylab = expression(X[t]),
#      xaxt = "n",
#      yaxt = "n")
# 
# axis(1, at = 1:n)
# axis(2, at = c(0,1), labels = c("No compra", "Compra"))
# 
# grid(nx = NA, ny = NULL, lty = 3, col = "grey80")



set.seed(1234)

n <- 30
p <- 0.65

Xt <- rbinom(n, 1, p)

plot(1:n, Xt,
     type = "n",
     ylim = c(-0.1,1.1),
     xlab = "Cliente",
     ylab = expression(X[t]),
     xaxt = "n",
     yaxt = "n")

axis(1, at = 1:n)
axis(2, at = c(0,1), labels = c("No compra","Compra"))

segments(1:n, 0, 1:n, Xt,
         col = "steelblue", lwd = 2)

points(1:n, Xt,
       pch = 19,
       cex = 1.4,
       col = ifelse(Xt==1,"forestgreen","firebrick"))

grid(nx = NA, ny = NULL, lty = 3)