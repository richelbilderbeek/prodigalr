#' prodigalr: call Prodigal from R
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_prodigal_installed()) {
#'   fasta_filename <- system.file("extdata", "prodigal.fasta", package = "prodigal")
#'   locatome <- run_prodigal(fasta_filename)
#'
#'   # Show as text
#'   cat(locatome, sep = "\n")
#'
#'   # Show as data frame
#'   print(locatome_to_df(locatome))
#'
#'   # Show as plot
#'   plot_locatome(locatome)
#' }
#' @docType package
#' @name prodigalr
NULL
