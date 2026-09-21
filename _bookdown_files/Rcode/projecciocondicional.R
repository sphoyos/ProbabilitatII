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
a <- 1
eps <- 0.15

# Puntos comprendidos entre a y a+eps
datos_proj <- subset(datos, x >= a & x <= a + eps)

# Gráfico de dispersión
p <- ggplot(datos, aes(x = x, y = y)) +
  geom_point(color = "#1f77b4", alpha = 0.8, size = 1.8) +
  theme_classic(base_size = 16) +
  labs(x = expression(x), y = expression(y)) +
  
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
  
  # Flechas de proyección
  annotate(
    "segment",
    x = a +0.15, xend = max(x) + .2,
    y = c(-1, 0.8, 2.5),
    yend = c(-1, 0.8, 2.5),
    colour = "red",
    linewidth = 0.8,
    linetype = "dashed",
    arrow = arrow(length = unit(0.15, "cm"))
  ) +
  
  annotate(
    "text",
    x = max(x) - 0.6,
    y = 0.6,
    label = "Projection",
    colour = "red",
    size = 6,
    fontface = "bold"
  )+
  
  annotate(
    "text",
    x =a-0.15,
    y =min(y) -0.5,
    label = "a",
    colour = "red",
    parse=TRUE
  )+
  
  annotate(
    "text",
    x =a+0.6,
    y = min(y)-0.5,
    label = "a+epsilon",
    colour = "red",
    parse=TRUE
  )
  
   # 
   # g_hist <- ggplot(datos_proj, aes(y)) +
   # geom_histogram(
   #   bins = 10,
   #   fill="skyblue",
   #   color="grey40"
   #   )+
   # 
   #   coord_flip() +
   #   scale_x_reverse() +
   #   theme_void()

# print(g_hist)
  library(cowplot)
  
 # g<- plot_grid(
 #    p,
 #    g_hist,
 #    nrow = 1,
 #    rel_widths = c(4, 1)
 #  )

# 
# aligned <- align_plots(p, g_hist, align = "h", axis = "tb")
# 
# g <- plot_grid(
#   aligned[[1]],
#   aligned[[2]],
#   nrow = 1,
#   rel_widths = c(4, 1)
# )


 

 
 # Histograma de los valores seleccionados
 h <- hist(datos_proj$y, breaks = 10, plot = FALSE)
 
 # Escalar las frecuencias para que entren a la derecha
 anchura <- 0.8
 freq <- h$counts / max(h$counts) * anchura
 
 hist_df <- data.frame(
   ymin = h$breaks[-length(h$breaks)],
   ymax = h$breaks[-1],
   xmin = max(datos$x) + 0.2,
   xmax = max(datos$x) + 0.2 + freq
 )
 
g<- p +
   geom_rect(
     data = hist_df,
     aes(
       xmin = xmin,
       xmax = xmax,
       ymin = ymin,
       ymax = ymax
     ),
     inherit.aes = FALSE,
     fill = "skyblue",
     colour = "grey40"
   ) +
   coord_cartesian(
     xlim = c(min(datos$x), max(hist_df$xmax) + 0.2)
   )
 
 print (g)
 