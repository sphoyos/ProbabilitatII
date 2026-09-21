# Malla para los ejes
x <-sort( c(seq(0, 2, length.out=21 ),0.9999))
y <- seq(0, 4, length.out=41)

# Superficie: NA fuera del soporte
z <- outer(x, y, function(x,y){
  
  ifelse(
    x >= 1 & x <= 2 &
      y >= 3 & y <= 4,
    (x+y)/5,
    0
  )
  
})

p <- persp(
  x, y, z,
  theta =0,
  phi = 25,
  expand = 0.8,
  col = "transparent",
  border = "black",
  shade = 0,
  ticktype = "detailed",
  xlim = c(0,2),
  ylim = c(0,4),
  zlim = c(0,1.3),
  xlab = "x",
  ylab = "y",
  zlab = "f(x,y)",
  main = expression(f(x,y)==(x+y)/5)
)

# Función auxiliar
seg3d <- function(x0,y0,z0,x1,y1,z1,col="red",lwd=1,lty=3){
  A <- trans3d(x0,y0,z0,p)
  B <- trans3d(x1,y1,z1,p)
  segments(A$x,A$y,B$x,B$y,col=col,lwd=lwd)
}

# Proyección sobre z=0
seg3d(1,3,0,2,3,0)
seg3d(2,3,0,2,4,0)
seg3d(2,4,0,1,4,0)
seg3d(1,4,0,1,3,0)

# Coordenadas de los vértices proyectados
P <- trans3d(
  x = c(1,2,2,1),
  y = c(3,3,4,4),
  z = c(0,0,0,0),
  pmat = p
)

polygon(
  P$x,
  P$y,
  col = "lightgray",
  border = "red",
  lwd = 2
)

# Líneas verticales de proyección

seg3d(1,3,0,1,3,(1+3)/5)

seg3d(2,3,0,2,3,(2+3)/5)

seg3d(1,4,0,1,4,(1+4)/5)

seg3d(2,4,0,2,4,(2+4)/5)
