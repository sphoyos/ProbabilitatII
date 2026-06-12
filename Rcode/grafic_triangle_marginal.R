library(ggplot2)

# 1. Definir los puntos clave de la recta
puntos <- data.frame(
  x = c(0.2, 0.3, 0.6, 0.3, 0.5, 1.0),
  y = c(1.6, 1.4, 0.8, 2.0, 1.0, 1.0)
)

etiquetas_x <- c("x[1]", "x[3]", "x[2]", "bold('1')", "x[4]")
etiquetas_y <- c("y[1]", "y[4]", "y[2]", "bold('2')", "y[3]")
  


# 2. Construir el gráfico
p <- ggplot() +
  # Eje X horizontal cruzando en Y = 0
  geom_hline(yintercept = 0, color = "black", linewidth = 1.2) + 
  # Eje Y vertical cruzando en X = 0
  geom_vline(xintercept = 0, color = "black", linewidth = 1.2) +
  # Región sombreada (área bajo la recta en el primer cuadrante)
  geom_polygon(data = data.frame(x = c(0, 1, 0), y = c(0, 0, 2)), 
               aes(x = x, y = y), fill = "darkgray", alpha = 0.7) +
  
  # Línea recta principal (2x + y = 2)
  geom_segment(aes(x = 0, y = 2, xend = 1, yend = 0), color = "black", linewidth = 0.8) +
  
  # --- LÍNEAS DISCONTINUAS DE LOS PUNTOS ①, ②, ③, ④ ---
  # Punto 1 (x1, y1)
  geom_segment(aes(x = 0, y = 0.5, xend = 0.25, yend = 0.5), linetype = "dotted") +
  geom_segment(aes(x = 0.25, y = 0, xend = 0.25, yend = 0.5), linetype = "dotted") +
  
  # Punto 2 (x2, y2)
  geom_segment(aes(x = 0, y = 1.6, xend = 0.68, yend = 1.6), linetype = "dotted") +
  geom_segment(aes(x = 0.68, y = 0, xend = 0.68, yend = 1.6), linetype = "dotted") +
  
  # Punto 3 (x3, y3)
  geom_segment(aes(x = 0, y = 2.4, xend = 0.3, yend = 2.4), linetype = "dotted") +
  geom_segment(aes(x = 0.3, y = 0, xend = 0.3, yend = 2.4), linetype = "dotted") +
  geom_segment(aes(x = 0, y = 2.0, xend = 0.8, yend = 2.0), linetype = "dashed") +
  geom_segment(aes(x = 0.8, y = 0, xend = 0.8, yend = 2.0), linetype = "dashed") +
  
  # Punto 4 (x4, y4)
  geom_segment(aes(x = 0, y = 1.0, xend = 1.1, yend = 1.0), linetype = "dotted") +
  geom_segment(aes(x = 1.1, y = 0, xend = 1.1, yend = 1.0), linetype = "dotted") +
  
  # Dibujar los puntos negros
  geom_point(data = puntos, aes(x = x, y = y), color = "black", size = 2) +
  
  # --- ANOTACIONES DE TEXTO Y FLECHAS ---
 
  # Ecuación de la recta
  # Ecuación de la recta
annotate("text", x = 0.9, y = -0.2, label = "2x + y = 2", size = 4.5, fontface = "italic") +
geom_segment(aes(x = 0.8, y = -0.15, xend = 0.65, yend = 0.4), arrow = arrow(length = unit(0.2, "cm"))) +

# Etiquetas de los puntos (Corregidas sin la palabra 'expression')
  # Ecuación de la recta
  annotate("text", x = 0.9, y = -0.2, label = "2x + y = 2", size = 4.5, fontface = "italic") +
  geom_segment(aes(x = 0.8, y = -0.15, xend = 0.65, yend = 0.4), arrow = arrow(length = unit(0.2, "cm"))) +
  
  # Etiquetas de los puntos (Corregidas sin la palabra 'expression')
  annotate("text", x = 0.65, y = 1.85, label = "paste('(',1 - y[2]/2, ', ', y[2],')')", parse = TRUE, hjust = 0) +
  geom_segment(aes(x = 0.63, y = 1.85, xend = 0.22, yend = 1.62), arrow = arrow(length = unit(0.15, "cm")), linewidth = 0.6) +
  
  annotate("text", x = 0.42, y = 2.15, label = "paste('(',x[3], ', ', 2,')')", parse = TRUE, hjust = 0) +
  geom_segment(aes(x = 0.41, y = 2.15, xend = 0.32, yend = 2.02), arrow = arrow(length = unit(0.15, "cm")), linewidth = 0.6) +
  
  annotate("text", x = 0.55, y = 1.35, label = "paste('(',x[3], ', ', 2 - 2*x[3],')')", parse = TRUE, hjust = 0) +
  geom_segment(aes(x = 0.54, y = 1.35, xend = 0.32, yend = 1.4), arrow = arrow(length = unit(0.15, "cm")), linewidth = 0.6) +
  
  annotate("text", x = 0.55, y = 1.15, label = "paste('(',(1 - y[4]/2), ', ', y[4],')')", parse = TRUE, hjust = 0) +
  geom_segment(aes(x = 0.54, y = 1.15, xend = 0.51, yend = 1.02), arrow = arrow(length = unit(0.15, "cm")), linewidth = 0.6) +
  
  annotate("text", x = 1.05, y = 0.75, label = "paste('(',1, ', ', y[4],')')", parse = TRUE, hjust = 0) +
  geom_segment(aes(x = 1.05, y = 0.77, xend = 1.01, yend = 0.95), arrow = arrow(length = unit(0.15, "cm")), linewidth = 0.6) +
  
  annotate("text", x = 0.68, y = 0.6, label = "paste('(',x[2], ', ', 2 - 2*x[2],')')", parse = TRUE, hjust = 0) +
  geom_segment(aes(x = 0.67, y = 0.6, xend = 0.61, yend = 0.78), arrow = arrow(length = unit(0.15, "cm")), linewidth = 0.6) +
  
   
  # SOLUCIÓN AL ERROR: Se eliminó aes() de geom_label() ya que son posiciones estáticas fijas
  #geom_label(aes(x = 0.2, y = 0.6, label = "1", linewidth = 0.5, label.padding = unit(0.15, "lines")) +
  #geom_label(x = 0.64, y = 1.65, label = "2", linewidth = 0.5, label.padding = unit(0.15, "lines")) +
  #geom_label(x = 0.35, y = 2.45, label = "3",, linewidth = 0.5, label.padding = unit(0.15, "lines")) +
  #geom_label(x = 1.05, y = 1.05, label = "4",, linewidth = 0.5, label.padding = unit(0.15, "lines")) +
  
  
  geom_label(aes(x = 0.2, y = 0.6, label = "1" )) +
  geom_label(aes(x = 0.64, y = 1.65, label = "2" )) +
  geom_label(aes(x = 0.35, y = 2.45, label = "3" )) +
  geom_label(aes(x = 1.1, y = 1.05, label = "4" )) +
  
  
  # --- EJES Y MARCAS ---
  scale_x_continuous(expand = c(0, 0), limits = c(-0.1, 1.4), 
                     breaks = c(0.25, 0.3, 0.68, 1.0, 1.1), 
                     labels =parse(text = etiquetas_x)) +
  scale_y_continuous(expand = c(0, 0), limits = c(-0.3, 2.7), 
                     breaks = c(0.5, 1.0, 1.6, 2.0, 2.4), 
                     labels = parse(text = etiquetas_y)) +
  
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
   # axis.line = element_line(color = "black", linewidth = 1.2, arrow = arrow(length = unit(0.3, "cm"))),
   axis.line=element_blank() ,
   axis.title.x = element_text(hjust = 1, face = "bold", size = 14),
    axis.title.y = element_text(vjust = 1, angle = 0, face = "bold", size = 14),
    axis.text = element_text(size = 12, color = "black")
  ) +
  labs(x = "x", y = "y")

# Imprimir gráfico final
print(p)
