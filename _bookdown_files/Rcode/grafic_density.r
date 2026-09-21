library(ggplot2)

# ---------------------------
# PARAMETROS
# ---------------------------
x0 <- 2

# Datos del área triangular
A1 <- data.frame(
  x = c(x0, 4, 4),
  y = c(x0, 4, x0)
)

# ---------------------------
# GRAFICO 1
# ---------------------------
g1 <- ggplot() +
  
  # Area sombreada
  geom_polygon(
    data = A1,
    aes(x, y),
    fill = "skyblue",
    alpha = 0.4,
    color = "steelblue",
    linewidth = 0.8
  ) +
  
  # Recta y=x
  geom_abline(
    slope = 1,
    intercept = 0,
    linewidth = 0.8
  ) +
  
  # Guias
  geom_vline(xintercept = c(2,4),
             linetype = "dashed") +
  geom_hline(yintercept = c(2,4),
             linetype = "dashed") +
  
  
  geom_segment(aes(x=2.8, xend=2.8, y=2, yend=2.8),
               linetype = "dashed",
               color = "steelblue",
  ) +
  
  
  
  geom_segment(aes(x=2.8, xend=2.8, y=0, yend=2),
               linetype = "dotted",
               color = "steelblue",
  ) +
  
  
  annotate("text",
           x = 0.8,
           y = 0.9,
           label = "y = x",
           angle = 35) +
  
  annotate("text",
           x = 4.15,
           y = 3,
           label = "A",
           size = 6,
           fontface = "bold") +
  
  annotate("text",
           x = 2.8 + 0.12,
           y = 2.4,
           label = "2 < x < 4",
           angle = 90,
           size = 4) +
  
  coord_cartesian(
    xlim = c(0,4.5),
    ylim = c(0,4.5),
    expand = FALSE
  ) +
  
  labs(x = NULL, y = NULL) +
  
  theme_classic(base_size = 14)

#g1
library(ggplot2)

# ---------------------------
# PARAMETROS
# ---------------------------
y0 <- 2

# Área triangular
A2 <- data.frame(
  x = c(y0, 4, 4),
  y = c(y0, 4, y0)
)

# ---------------------------
# GRAFICO 2
# ---------------------------
g2 <- ggplot() +
  
  geom_polygon(
    data = A2,
    aes(x, y),
    fill = "tomato",
    alpha = 0.4,
    color = "firebrick",
    linewidth = 0.8
  ) +
  
  geom_abline(
    slope = 1,
    intercept = 0,
    linewidth = 0.8
  ) +
  
  geom_vline(
    xintercept = c(2,4),
    linetype = "dashed"
  ) +
  
  geom_hline(
    yintercept = c(2,4),
    linetype = "dashed"
  ) +
  
  geom_segment(aes(x=3.6, xend=4, y=3.6, yend=3.6),
    linetype = "dashed",
    color = "firebrick",
  ) +
  
  geom_segment(aes(x=0, xend=3.6, y=3.6, yend=3.6),
               linetype = "dotted",
               color = "firebrick",
  ) +
  
  
  annotate("text",
           x = 0.8,
           y = 0.9,
           label = "y = x",
           angle = 35) +
  
  annotate("text",
           x = 4.15,
           y = 3,
           label = "A",
           size = 6,
           fontface = "bold") +
  
  annotate("text",
           x = (3.6+4)/2,
           y = 3.5 ,
           label = "y < x < 4",
           size = 4) +
  
  coord_cartesian(
    xlim = c(0,4.5),
    ylim = c(0,4.5),
    expand = FALSE
  ) +
  
  labs(x = NULL, y = NULL) +
  
  theme_classic(base_size = 14)

#g2

library(pacman)
p_load(patchwork)

print(g1+g2)
