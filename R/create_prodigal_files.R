#' Create the Prodigal output files, by running Prodigal
#' @inheritParams default_params_doc
#' @return full paths to the files created
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (is_prodigal_installed()) {
#'   fasta_filename <- system.file(
#'     "extdata", "covid19.fasta", package = "prodigalr"
#'   )
#'   filenames <- create_prodigal_files(fasta_filename)
#'   expect_equal(4, length(filenames))
#'   expect_true(all(file.exists((filenames))))
#' }
#' @seealso use \link{run_prodigal} to received
#'   also the parsed output
#' @export
create_prodigal_files <- function(
  fasta_filename,
  folder_name = get_default_prodigal_folder(),
  output_filename = tempfile("output_"),
  trans_filename = tempfile("trans_"),
  nuc_filename = tempfile("nuc_"),
  start_filename = tempfile("start_")
) {
  prodigalr::check_prodigal_installation(folder_name = folder_name)
  prodigal_folder <- file.path(folder_name, "Prodigal")
  testthat::expect_true(dir.exists(prodigal_folder))
  bin_filename <- file.path(prodigal_folder, "prodigal")
  testthat::expect_true(file.exists(bin_filename))

  dir.create(dirname(output_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(trans_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(start_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(nuc_filename), showWarnings = FALSE, recursive = TRUE)

  error_code <- system2(
    command = bin_filename,
    args = c(
      "-i", fasta_filename,
      "-a", trans_filename,
      "-d", nuc_filename,
      "-o", output_filename,
      "-s", start_filename
    ),
    stdout = FALSE,
    stderr = FALSE
  )

  if (error_code != 0) {
    stop("Warning or error: '", error_code, "'")
  }
  c(output_filename, trans_filename, start_filename, nuc_filename)
}
