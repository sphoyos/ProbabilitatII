##############################################################
# Distribución Normal Bivariante
# Superficie + muestras + elipse + marginales
##############################################################

library(MASS)
library(mvtnorm)
library(plotly)

#-------------------------------------------------------------
# Parámetros
#-------------------------------------------------------------

mu <- c(0,0)

Sigma <- matrix(c(1,0.6,
                  0.6,2),
                nrow=2)

set.seed(123)

n <- 10000

datos <- mvrnorm(n, mu, Sigma)

#-------------------------------------------------------------
# Mallado para la superficie
#-------------------------------------------------------------

x <- seq(-5,5,length.out=80)
y <- seq(-5,5,length.out=80)

grid <- expand.grid(x=x,y=y)

z <- matrix(
  dmvnorm(grid,
          mean=mu,
          sigma=Sigma),
  nrow=length(x),
  byrow=FALSE
)

#-------------------------------------------------------------
# Densidades marginales
#-------------------------------------------------------------

fx <- dnorm(
  x,
  mu[1],
  sqrt(Sigma[1,1])
)

fy <- dnorm(
  y,
  mu[2],
  sqrt(Sigma[2,2])
)

#-------------------------------------------------------------
# Elipse 3σ
#-------------------------------------------------------------

L <- t(chol(Sigma))

theta <- seq(0,2*pi,length.out=300)

circle <- rbind(
  cos(theta),
  sin(theta)
)

ellipse <- 3*L%*%circle

#-------------------------------------------------------------
# Histogramas
#-------------------------------------------------------------

hx <- hist(
  datos[,1],
  breaks=25,
  plot=FALSE
)

hy <- hist(
  datos[,2],
  breaks=25,
  plot=FALSE
)

#-------------------------------------------------------------
# Figura
#-------------------------------------------------------------

fig <- plot_ly()

#-------------------------------------------------------------
# Superficie de la normal bivariante
#-------------------------------------------------------------

fig <- fig %>%
  add_surface(
    x=x,
    y=y,
    z=z,
    opacity=0.60,
    colorscale="YlGnBu",
    showscale=FALSE,
    name="Densidad"
  )

#-------------------------------------------------------------
# Muestras
#-------------------------------------------------------------

fig <- fig %>%
  add_markers(
    x=datos[,1],
    y=datos[,2],
    z=rep(0,n),
    marker=list(
      size=1.5,
      color="black",
      opacity=0.20
    ),
    name="Muestras"
  )

#-------------------------------------------------------------
# Elipse de 3σ
#-------------------------------------------------------------

fig <- fig %>%
  add_trace(
    x=ellipse[1,],
    y=ellipse[2,],
    z=rep(0.001,ncol(ellipse)),
    type="scatter3d",
    mode="lines",
    line=list(
      color="darkgreen",
      width=8
    ),
    name="Elipse 3σ"
  )

#-------------------------------------------------------------
# Histograma marginal X
#-------------------------------------------------------------

for(i in seq_along(hx$density))
{
  
  fig <- fig %>%
    add_trace(
      type="scatter3d",
      mode="lines",
      x=c(hx$mids[i],hx$mids[i]),
      y=c(max(y),max(y)),
      z=c(0,hx$density[i]),
      line=list(
        color="black",
        width=3
      ),
      showlegend=FALSE
    )
  
}

#-------------------------------------------------------------
# Histograma marginal Y
#-------------------------------------------------------------

for(i in seq_along(hy$density))
{
  
  fig <- fig %>%
    add_trace(
      type="scatter3d",
      mode="lines",
      x=c(min(x),min(x)),
      y=c(hy$mids[i],hy$mids[i]),
      z=c(0,hy$density[i]),
      line=list(
        color="black",
        width=3
      ),
      showlegend=FALSE
    )
  
}

#-------------------------------------------------------------
# Densidad marginal X
#-------------------------------------------------------------

fig <- fig %>%
  add_trace(
    type="scatter3d",
    mode="lines",
    x=x,
    y=rep(max(y),length(x)),
    z=fx,
    line=list(
      color="blue",
      width=6
    ),
    name="Marginal X"
  )

#-------------------------------------------------------------
# Densidad marginal Y
#-------------------------------------------------------------

fig <- fig %>%
  add_trace(
    type="scatter3d",
    mode="lines",
    x=rep(min(x),length(y)),
    y=y,
    z=fy,
    line=list(
      color="red",
      width=6
    ),
    name="Marginal Y"
  )

#-------------------------------------------------------------
# Diseño
#-------------------------------------------------------------

fig <- fig %>%
  layout(
    
    title=list(
      text="<b>Distribución normal bivariante</b>",
      x=0.5
    ),
    
    paper_bgcolor="white",
    plot_bgcolor="white",
    
    font=list(
      family="Arial",
      size=14
    ),
    
    scene=list(
      
      aspectmode="cube",
      
      camera=list(
        eye=list(
          x=1.7,
          y=1.7,
          z=1.15
        )
      ),
      
      xaxis=list(
        title="X",
        showbackground=FALSE,
        showgrid=TRUE,
        gridcolor="gainsboro",
        zerolinecolor="gray60"
      ),
      
      yaxis=list(
        title="Y",
        showbackground=FALSE,
        showgrid=TRUE,
        gridcolor="gainsboro",
        zerolinecolor="gray60"
      ),
      
      zaxis=list(
        title="Densidad",
        showbackground=FALSE,
        showgrid=TRUE,
        gridcolor="gainsboro",
        zerolinecolor="gray60"
      )
    )
    
  )

fig