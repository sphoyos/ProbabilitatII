# Regenera les versions HTML i PDF definides a _output.yml.
# Executa'l des de l'arrel del projecte amb:
#   Rscript render_book.R

if (!requireNamespace("bookdown", quietly = TRUE)) {
  stop("Cal instal·lar el paquet 'bookdown': install.packages('bookdown')")
}

bookdown::render_book("index.rmd", clean_envir = TRUE)
