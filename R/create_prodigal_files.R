#' Create the Prodigal output files, by running Prodigal
#' @inheritParams default_params_doc
#' @return full path to the files created
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_prodigal_installed()) {
#'   fasta_filename <- system.file(
#'     "extdata", "prodigal.fasta", package = "prodigalr"
#'   )
#'   filenames <- create_prodigal_files(fasta_filename)
#'   expect_equal(5, length(filenames))
#"   expect_true(all(file.exists((filenames))))
#' }
#' @seealso use \link{run_prodigal} to received
#'   also the parsed output
#' @export
create_prodigal_files <- function(
  fasta_filename,
  folder_name = get_default_prodigal_folder(),
  temp_folder_name = tempfile(pattern = "prodigal_")
) {
  prodigalr::check_prodigal_installation(folder_name = folder_name)
  prodigal_folder <- file.path(folder_name, "Prodigal")
  testthat::expect_true(dir.exists(prodigal_folder))
  bin_filename <- file.path(prodigal_folder, "prodigal")
  testthat::expect_true(file.exists(bin_filename))

  dir.create(
    temp_folder_name, showWarnings = FALSE, recursive = TRUE
  )
  testthat::expect_true(dir.exists(temp_folder_name))

  text <- system2(
    command = bin_filename,
    args = c(
      "-i", fasta_filename,
      "-o", temp_folder_name
    ),
    stdout = TRUE,
    stderr = TRUE
  )

  if (length(text) != 0) {
    stop("Warning or error: '", text, "'")
  }
  list.files(
    temp_folder_name,
    recursive = TRUE,
    full.names = TRUE
  )
}
