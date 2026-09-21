#----------------------------------------------------------------------------------

#install.packages("plot3D")
library(plot3D)
library(mvtnorm)


######################

mu <- c(0,0)
Sigma <- matrix(c(1,0.8,
                  0.8,1),2)

x <- seq(-4,4,length=100)
y <- seq(-4,4,length=100)

grid <- expand.grid(x=x,y=y)

z <- matrix(
  dmvnorm(grid, mean=mu, sigma=Sigma),
  nrow=100
)

par(mfrow = c(1,2))

persp3D(
  x, y, z,
  colvar = z,                 # colorear según la altura
  col = jet.col(100),         # paleta tipo MATLAB
  phi = 25,
  theta = 35,
  border = "black",
  shade = 0.01,
  xlab = "x",
  ylab = "y",
  zlab = "f(x,y)",
  bty = "b2",          
  ticktype = "detailed"
  
)


image2D(
  z = z, x = x, y = y,
  col = jet.col(100),       # Misma paleta estilo MATLAB
  xlab = "Eje X",
  ylab = "Eje Y",
  main = "Curvas de Nivel (Plano X-Y)",
  contour = list(col = "black", lwd = 1.5) # Dibuja las líneas negras encima
) 
