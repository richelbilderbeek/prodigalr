#' Measure if Prodigal is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is Prodigal is installed locally,
#'   FALSE otherwise
#' @examples
#' library(testthat)
#'
#' is_installed <- is_prodigal_installed()
#' expect_true(is_installed == TRUE || is_installed == FALSE)
#' @author Richèl J.C. Bilderbeek
#' @export
is_prodigal_installed <- function(
  folder_name = get_default_prodigal_folder()
) {
  bin_file_path <- file.path(folder_name, "Prodigal", "prodigal")
  file.exists(bin_file_path)
}
