# Regenera les versions HTML i PDF definides a _output.yml.
# Executa'l des de l'arrel del projecte amb:
#   Rscript render_book.R

if (!requireNamespace("bookdown", quietly = TRUE)) {
  stop("Cal instal·lar el paquet 'bookdown': install.packages('bookdown')")
}

# Renderitza cada format explícitament perquè tant el gitbook com el PDF
# s'actualitzin en cada execució. El PDF es desa a docs/Probabilitat-II.pdf.
bookdown::render_book("index.RMD", "bookdown::gitbook")
bookdown::render_book("index.RMD", "bookdown::pdf_book")

