
library(diagram)

# Definim la matriu de transició de 3x3 
# (Traspuesta perquè la llibreria 'diagram' llegeixi correctament Origen -> Destí)
P_graf_3 <- matrix(c(0.6, 0.3, 0.1,   # Destins cap a Sol
                     0.2, 0.4, 0.4,   # Destins cap a Nuvolós
                     0.2, 0.4, 0.4),  # Destins cap a Pluja
                   nrow = 3, byrow = TRUE)

# Noms dels estats en català
noms_3 <- c("Sol (S)", "Nuvolat (N)", "Pluja (P)")


# Configuració del gràfic en forma de triangle
plotmat(P_graf_3, 
        pos = c(1, 2),             # Un node a dalt (Sol) i dos a baix (Nuvolós i Pluja)
        name = noms_3, 
        lwd = 2,                   # Gruix de les fletxes
        box.lwd = 2,               # Gruix del vora dels cercles
        box.size = 0.05,           # Mida dels cercles
        box.type = "circle",       # Forma del node
        box.prop = 1, 
        box.col = c("#FFF9C4", "#E0E0E0", "#E1F5FE"), # Groc, Gris, Blau
        arr.length = 0.2,          # Mida de la punta de la fletxa
        cex.txt = 0.8,             # Grandaria de la lletra  
        arr.width = 0.10, 
        shadow.size = 0,           # Sense ombra per a un disseny net
        main = "Cadena de markov: Clima amb 3 Estats")


