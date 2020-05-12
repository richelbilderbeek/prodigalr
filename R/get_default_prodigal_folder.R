#' Get the path to the folder where this package installs
#' Prodigal by default
#' @return the path to the folder where this package installs
#'   Prodigal by default
#' @examples
#' library(testthat)
#'
#' if (rappdirs::app_dir()$os == "unix") {
#'   expect_true(
#'     grepl(
#'       "/home/[A-Za-z0-9_]*/.local/share",
#'       get_default_prodigal_folder()
#'     )
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_prodigal_folder <- function() {
  rappdirs::user_data_dir()
}

