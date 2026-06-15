# Posición de la proyección
a <- 0
eps <- 0.15

# Puntos comprendidos entre a y a+eps
datos_proj <- subset(datos, x >= a & x <= a + eps)

g_scatter <- ggplot(datos, aes(x, y)) +
  geom_point(
    colour = "#1f77b4",
    alpha = .8,
    size = 1.2
  ) +
  
  # Puntos rojos proyectados
  geom_point(
    data = datos_proj,
    colour = "red",
    size = 2
  ) +
  
  # Línea vertical x = a
  geom_vline(
    xintercept = a,
    colour = "#E69F00",
    linetype = "dashed",
    linewidth = 1
  ) +
  
  # Línea vertical x = a + eps
  geom_vline(
    xintercept = a + eps,
    colour = "#E69F00",
    linetype = "dashed",
    linewidth = 1
  ) +
  
  # Algunas proyecciones horizontales
  geom_segment(
    data = datos_proj[c(10, 30, 60), ],
    aes(
      x = min(datos$x),
      xend = a + eps/2,
      y = y,
      yend = y
    ),
    colour = "red",
    linetype = "dashed",
    linewidth = 0.8,
    inherit.aes = FALSE,
    arrow = arrow(length = unit(0.15, "cm"))
  ) +
  
  annotate(
    "text",
    x = min(datos$x) + 1,
    y = max(datos$y) * 0.6,
    label = "Projection",
    colour = "red",
    size = 7,
    fontface = "bold"
  ) +
  
  coord_cartesian(ylim = ylim) +
  labs(
    x = expression(x),
    y = expression(y)
  ) +
  theme_classic(base_size = 16)


