# Instalar paquetes si es necesario
# install.packages(c("ggplot2", "ggExtra"))
library(pacman)
library(ggplot2)
p_load(ggExtra)

set.seed(123)

# Datos simulados correlacionados
n <- 1000
x <- rnorm(n)

y <- 0.7 * x + rnorm(n, sd = 0.8)

datos <- data.frame(x, y)
a <- 0
eps <- 0.15

# Puntos comprendidos entre a y a+eps
datos_proj <- subset(datos, x >= a & x <= a + eps)

# Gráfico de dispersión
p <- ggplot(datos, aes(x = x, y = y)) +
  geom_point(color = "#1f77b4", alpha = 0.8, size = 1.8) +
  theme_classic(base_size = 16) +
  labs(x = expression(x), y = expression(y)) +
  
  # Flechas de proyección
  annotate(
    "segment",
    x = max(x) - 1.5, xend = max(x) + .5,
    y = c(-2, 0, 2),
    yend = c(-2, 0, 2),
    colour = "red",
    linewidth = 0.8,
    linetype = "dashed",
    arrow = arrow(length = unit(0.15, "cm"))
  ) +
  
  annotate(
    "text",
    x = max(x) - 0.2,
    y = 0.6,
    label = "Projection",
    colour = "red",
    size = 6,
    fontface = "bold"
  )




# Histograma marginal a la izquierda
p<-ggMarginal(
  p,
  type = "histogram",
  margins = "y",
  bins = 15,
  fill = "#6baed6",
  colour = "#4a78a8"
)

print(p)

