#' Get the Prodigal version
#' @inheritParams default_params_doc
#' @return the Prodigal version as a string, for example \code{2.6.3}
#' @examples
#' library(testthat)
#'
#' if (is_prodigal_installed()) {
#'   version <- get_prodigal_version()
#'   expect_true(nchar(version) >= 1)
#' }
#' @export
get_prodigal_version <- function(
  folder_name = get_default_prodigal_folder()
) {
  prodigalr::check_prodigal_installation(folder_name = folder_name)
  prodigal_folder <- file.path(folder_name, "Prodigal")
  testthat::expect_true(dir.exists(prodigal_folder))
  bin_filename <- file.path(prodigal_folder, "prodigal")
  testthat::expect_true(file.exists(bin_filename))

  text <- system2(
    command = bin_filename,
    args = "-v",
    stdout = TRUE,
    stderr = TRUE
  )
  line <- text[text != ""]
  # Example line: Prodigal V2.6.3: February, 2016
  stringr::str_match(string = line, pattern = " V(.....):")[1, 2]
}
