# dibuix process poisson




library(ggplot2)

# Definició dels punts de salt (S_n) i temps (t)
S <- c(0, 1.8, 3.2, 6.2, 8.5)
t_val <- 4.2
y_t <- 2

# Creació del gràfic
g<-ggplot() +
  # Línia de l'eix X (base)
  geom_hline(yintercept = 0, color = "black", linewidth = 0.6) +
  
  # Tram 0 a S1
  geom_segment(aes(x = 0, xend = S[2], y = 0, yend = 0), linewidth = 1.2) +
  geom_segment(aes(x = S[2], xend = S[2], y = 0, yend = 1), linewidth = 1.2) +
  
  # Tram S1 a S2
  geom_segment(aes(x = S[2], xend = S[3], y = 1, yend = 1), linewidth = 1.2) +
  geom_segment(aes(x = S[3], xend = S[3], y = 1, yend = 2), linewidth = 1.2) +
  
  # Tram S2 a S3
  geom_segment(aes(x = S[3], xend = S[4], y = 2, yend = 2), linewidth = 1.2) +
  geom_segment(aes(x = S[4], xend = S[4], y = 2, yend = 3), linewidth = 1.2) +
  
  # Tram des de S3 endavant
  geom_segment(aes(x = S[4], xend = S[5], y = 3, yend = 3), linewidth = 1.2) +
  
  # Punts als salts
  geom_point(aes(x = c(S[2], S[3], S[4]), y = c(1, 2, 3)), size = 2.5) +
  
  # Fletxa vertical per a N(t)
  geom_segment(aes(x = t_val, xend = t_val, y = 0, yend = y_t), 
               arrow = arrow(length = unit(0.25, "cm")), color = "black") +
  
  # Fletxes horitzontals per a X1, X2, X3
  geom_segment(aes(x = 0, xend = S[2], y = 0.5, yend = 0.5), 
               arrow = arrow(ends = "both", length = unit(0.2, "cm"))) +
  geom_segment(aes(x = S[2], xend = S[3], y = 1.5, yend = 1.5), 
               arrow = arrow(ends = "both", length = unit(0.2, "cm"))) +
  geom_segment(aes(x = S[3], xend = S[4], y = 2.5, yend = 2.5), 
               arrow = arrow(ends = "both", length = unit(0.2, "cm"))) +
  
  # Etiquetes de text
  annotate("text", x = 0, y = -0.25, label = "0", size = 5) +
  annotate("text", x = S[2], y = -0.25, label = expression(S[1]), size = 5) +
  annotate("text", x = S[3], y = -0.25, label = expression(S[2]), size = 5) +
  annotate("text", x = S[4], y = -0.25, label = expression(S[3]), size = 5) +
  annotate("text", x = t_val, y = -0.25, label = "t", size = 5) +
  
  annotate("text", x = S[2]/2, y = 0.5, label = expression(X[1]), vjust = -0.5, size = 5) +
  annotate("text", x = (S[2]+S[3])/2, y = 1.5, label = expression(X[2]), vjust = -0.5, size = 5) +
  annotate("text", x = (S[3]+S[4])/2, y = 2.5, label = expression(X[3]), vjust = -0.5, size = 5) +
  
  annotate("text", x = t_val + 0.35, y = 1.7, label = expression(N(t)), size = 5) +
  annotate("text", x = 6.5, y = 1.3, 
           label = expression(N(t) == n ~~~ "for" ~~~ S[n] <= t ~ "<" ~ S[n+1]), size = 5) +
  
  # Estil del gràfic
  coord_cartesian(xlim = c(-0.2, 8.8), ylim = c(-0.5, 3.5)) +
  theme_void()

print(g)
