

library(DiagrammeR)

g<-grViz("
digraph Markov {

graph [
  layout = neato,
  overlap = false
]

node [
  shape = circle,
  fixedsize = true,
  width = 0.6,
  fontsize = 14
]

edge [
  fontsize = 12
]

# 1. Definim els nodes amb posicions fixes (X, Y!)
0 [pos = '0,0!']
1 [pos = '2,0!']
2 [pos = '4,0!']
3 [pos = '6,0!']
4 [pos = '8,0!']

# 2. Bucles
0 -> 0 [label = '1', tailport = 'w', headport = 'nw']
4 -> 4 [label = '1', tailport = 'e', headport = 'ne']

# 3. Transicions cap a la dreta (p) per dalt
1 -> 2 [label = 'p', constraint = false]
2 -> 3 [label = 'p', constraint = false]
3 -> 4 [label = 'p', constraint = false]

# 4. Transicions cap a l'esquerra (1-p) per baix
1 -> 0 [label = '1-p', constraint = false]
2 -> 1 [label = '1-p', constraint = false]
3 -> 2 [label = '1-p', constraint = false]
}
",height=150)

if (knitr::is_html_output()) {
  
  g
  
} else {
  
  
  svg <- export_svg(g)
  rsvg_pdf(charToRaw(svg), tempfile <- tempfile(fileext = ".pdf"))
  
  knitr::include_graphics(tempfile)
}
